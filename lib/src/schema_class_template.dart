import 'package:html/dom.dart';
import 'package:openapi_client_builder_builder/src/schema_class_member.dart';
import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';

class SchemaClassTemplate {
  SchemaClassTemplate(
      {required Element classNameTag,
      required List<Element> classCommentTags,
      required List<String> tableRows}) {
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
      final member = SchemaClassMember(comment,
          rowParts.elementAt(1).trim().toDartType(), rowParts.first.trim());

      _classMembers.add(member);
    }

    _constructorString = _classMembers
        .map<String>((member) => '${member.type}? ${member.name}')
        .join(', ');

    _initializerListString = _classMembers
        .map<String>((member) => '_${member.name} = ${member.name}')
        .join(', ');

    _combinedClassMembersString = _classMembers
        .map<String>((member) =>
            '  /// ${member.comment}\n  final ${member.type}? _${member.name};')
        .join('\n');

    _gettersString = _classMembers
        .map<String>((member) =>
            '  ${member.type}? get ${member.name} => _${member.name};')
        .join('\n');
  }

  late final Element _classNameTag;
  late final List<Element> _classCommentTags;
  late final String _className;
  late final String _classComment;
  final List<SchemaClassMember> _classMembers = [];
  late final String _constructorString;
  late final String _initializerListString;
  late final String _combinedClassMembersString;
  late final String _gettersString;

  String get output => '''

/// $_classComment
class $_className {
  $_className({$_constructorString}) : $_initializerListString;

$_combinedClassMembersString

$_gettersString
}

''';
}
