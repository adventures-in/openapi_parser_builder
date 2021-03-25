import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/enums/fields_type.dart';
import 'package:openapi_client_builder/src/schema/member_template.dart';
import 'package:openapi_client_builder/src/extensions/list_of_element_extensions.dart';

/// The first pass of parsing the spec document has produced a set data items,
/// each corresponding to a schema that we want a class template for.
///
/// We convert the data to something we can use in a class template by:
///   - remove spaces and 'Object' from the class name
///   - add /// between tags and after each newline for multiline comments
class ClassTemplate {
  ClassTemplate(
      {required FieldsType fieldsType,
      required Element classNameTag,
      required List<Element> classCommentTags,
      required List<String> tableRows})
      : _fieldsType = fieldsType,
        _className = (classNameTag.text.split(' ')..removeLast()).join(),
        _classComment = classCommentTags.toCommentsString() {
    //
    // Create class members by parsing the spec table.

    _classMembers =
        tableRows.map<MemberTemplate>((row) => MemberTemplate(row)).toList();

    // Iterate over members, creating parts of the class template.
    _constructorString = _classMembers
        .map<String>((member) =>
            (member.isRequired ? 'required ' : '') +
            '${member.typeValue} ${member.name}')
        .join(', ');

    _initializerListString = _classMembers
        .map<String>((member) => '_${member.name} = ${member.name}')
        .join(', ');

    if (_fieldsType == FieldsType.patterned) {
      _patternedMemberString =
          _classMembers.first.name.replaceAll(RegExp(r'{|}'), '') + 'Map';
    } else {
      _combinedClassMembersString = _classMembers
          .map<String>((member) =>
              '  /// ${member.comment}\n  final ${member.typeValue} _${member.name};')
          .join('\n');
    }

    _gettersString = _classMembers
        .map<String>((member) =>
            '  ${member.typeValue} get ${member.name} => _${member.name};')
        .join('\n');

    var fromJsonString =
        '  $_className.fromJson(Map<String, dynamic> json) :\n';
    fromJsonString += _classMembers
        .map<String>((member) => member.fromJsonString)
        .join(',\n');
    fromJsonString += ';';
    _fromJsonString = fromJsonString;
  }

  late final FieldsType _fieldsType;
  late final String _className;
  late final String _classComment;
  late final List<MemberTemplate> _classMembers;
  late final String _constructorString;
  late final String _initializerListString;
  late final String _combinedClassMembersString;
  late final String _patternedMemberString;
  late final String _gettersString;
  late final String _fromJsonString;

  String get output => _fieldsType == FieldsType.patterned
      ? '''

/// $_classComment
class $_className {
  $_className();

  Map<String, PathItem> $_patternedMemberString = {};

  $_className.fromJson(Map<String, dynamic> json) : 
    $_patternedMemberString = {}..addEntries(json.entries.map(
      (entry) => MapEntry(entry.key, PathItem.fromJson(entry.value))));
}

'''
      : '''

/// $_classComment
class $_className {
  $_className({$_constructorString}) : $_initializerListString;

$_combinedClassMembersString

$_gettersString

$_fromJsonString
}

''';
}
