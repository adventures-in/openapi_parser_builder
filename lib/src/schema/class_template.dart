import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/enums/fields_type.dart';
import 'package:openapi_client_builder/src/schema/member_template.dart';
import 'package:openapi_client_builder/src/schema/types/member_type.dart';

class ClassTemplate {
  ClassTemplate(
      {required FieldsType fieldsType,
      required Element classNameTag,
      required List<Element> classCommentTags,
      required List<String> tableRows}) {
    _fieldsType = fieldsType;
    _classNameTag = classNameTag;
    _classCommentTags = classCommentTags;

    // Remove spaces and 'Object' from the class name
    _className = (_classNameTag.text.split(' ')..removeLast()).join();

    // Add /// between tags and after each newline for multiline comments
    _classComment = _classCommentTags
        .map<String>((tag) => tag.text.replaceAll('\n', '\n/// '))
        .join('\n/// ');

    // Iterate over class members, parsing each in turn.
    for (final row in tableRows) {
      final rowParts = row.split(' | ');
      String? comment;
      if (rowParts.length > 2) {
        comment = rowParts.elementAt(2).trim();
      }
      final isRequired = (comment != null &&
          comment.length > 7 &&
          comment.substring(0, 8) == 'REQUIRED');
      final member = MemberTemplate(isRequired, comment,
          MemberType.from(rowParts.elementAt(1).trim()), rowParts.first.trim());

      _classMembers.add(member);
    }

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
  late final Element _classNameTag;
  late final List<Element> _classCommentTags;
  late final String _className;
  late final String _classComment;
  final List<MemberTemplate> _classMembers = [];
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
