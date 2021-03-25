import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/schema/member_template.dart';
import 'package:openapi_client_builder/src/extensions/list_of_element_extensions.dart';
import 'package:openapi_client_builder/src/extensions/list_of_member_template_extension.dart';
import 'package:openapi_client_builder/src/extensions/element_extensions.dart';

/// The first pass of parsing the spec document has produced a set data items,
/// each corresponding to a schema that we want a class template for.
///
/// We convert the data to something we can use in a class template by:
///   - remove spaces and 'Object' from the class name
///   - add /// between tags and after each newline for multiline comments
class ClassTemplate {
  ClassTemplate(
      {required Element classNameTag,
      required List<Element> classCommentTags,
      required Element tableTag})
      : _className = (classNameTag.text.split(' ')..removeLast()).join(),
        _classComment = classCommentTags.toCommentsString() {
    //
    // Create class members by parsing the spec table.

    _classMembers = tableTag.toMemberTemplates();

    // Iterate over members, creating parts of the class template.

    _constructorString = _classMembers.toConstructorString();
    _initializersString = _classMembers.toInilitializersString();
    _gettersString = _classMembers.toGettersString();
    _memberDeclarationsString = _classMembers.toDeclarationsString();

    _fromJsonString = '''
  $_className.fromJson(Map<String, dynamic> json) :
${_classMembers.toInitializersForFromJson()};
    ''';
  }

  late final String _className;
  late final String _classComment;
  late final List<MemberTemplate> _classMembers;
  late final String _constructorString;
  late final String _initializersString;
  late final String _memberDeclarationsString;
  late final String _gettersString;
  late final String _fromJsonString;

  String get classComment => _classComment;
  String get className => _className;
  String get firstMemberName => _classMembers.first.name;

  String get output => '''

/// $_classComment
class $_className {
  $_className({$_constructorString}) : $_initializersString;

$_memberDeclarationsString

$_gettersString

$_fromJsonString
}

''';
}
