import 'package:openapi_parser_builder/src/schema/member_template.dart';

extension ListOfMemberTemplateExtension on List<MemberTemplate> {
  String toConstructorString() => map<String>((member) =>
      (member.isRequired ? 'required ' : '') +
      '${member.typeName} ${member.variableName}').join(', ');

  String toInilitializersString() => map<String>(
          (member) => '_${member.variableName} = ${member.variableName}')
      .join(', ');

  String toDeclarationsString() => map<String>((member) =>
          '  /// ${member.comment}\n  final ${member.typeName} _${member.variableName};')
      .join('\n');

  String toGettersString() => map<String>((member) =>
          '  ${member.typeName} get ${member.variableName} => _${member.variableName};')
      .join('\n');

  String toFromJson(String className) =>
      '  $className.fromJson(Map<String, dynamic> json) :\n' +
      map<String>((member) => member.fromJsonString).join(',\n') +
      ';';
}
