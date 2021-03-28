import 'package:html/dom.dart';
import 'package:openapi_schema_builder/src/enums/fields_type.dart';
import 'package:openapi_schema_builder/src/schema/member_template.dart';
import 'package:openapi_schema_builder/src/extensions/list_of_element_extensions.dart';
import 'package:openapi_schema_builder/src/extensions/list_of_member_template_extension.dart';
import 'package:openapi_schema_builder/src/extensions/element_extensions.dart';
import 'package:openapi_schema_builder/src/extensions/string_extensions.dart';

/// The first pass of parsing the spec document has produced a set data items,
/// each corresponding to a schema that we want a class template for.
///
/// We convert the data to something we can use in a class template by:
///   - remove spaces and 'Object' from the class name
///   - add /// between tags and after each newline for multiline comments
class ClassTemplate {
  ClassTemplate({required Element classNameTag}) {
    //
    // Create class members by parsing the spec table.

    _className = (classNameTag.text.split(' ')..removeLast()).join();

    // Move to the next sibling till we get a h5 tag, indicating end of comments
    var classCommentTags = <Element>[];
    var nextTag = classNameTag.nextElementSibling;
    while (nextTag != null && nextTag.isNotTableHeader) {
      // Keep adding to the commentTags and moving on.
      classCommentTags.add(nextTag);
      nextTag = nextTag.nextElementSibling;
    }

    _classComment = classCommentTags.toCommentsString();

    // The next tag holds the whole table if there is one there.
    final tableTag = nextTag?.nextElementSibling;

    // If we don't have a table, this is not a schema item.
    if (tableTag == null || tableTag.text.split('\n').length < 3) {
      throw 'Not a valid Schema Object';
    }

    _members = tableTag.toMemberTemplates();

    final fieldsType = nextTag!.text.toFieldsType();

    if (fieldsType == FieldsType.patterned) {
      if (_members.length > 1) {
        throw 'More than one member: it is assumed that classes with Patterned Fields have only one member.';
      }
      final oldMember = _members.first;
      _members.clear();
      _members.add(oldMember.convertToPatternedField());
    }

    // Iterate over members, creating parts of the class template.
    _constructorString = _members.toConstructorString();
    _initializersString = _members.toInilitializersString();
    _gettersString = _members.toGettersString();
    _memberDeclarationsString = _members.toDeclarationsString();
    _fromJsonString = _members.toFromJson(_className);
  }

  late final List<MemberTemplate> _members;
  late final String _className;
  late final String _classComment;
  late final String _constructorString;
  late final String _initializersString;
  late final String _memberDeclarationsString;
  late final String _gettersString;
  late final String _fromJsonString;

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
