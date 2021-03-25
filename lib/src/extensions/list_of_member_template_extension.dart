import 'package:openapi_client_builder/src/schema/member_template.dart';

extension ListOfMemberTemplateExtension on List<MemberTemplate> {
  String toConstructorString() => map<String>((member) =>
      (member.isRequired ? 'required ' : '') +
      '${member.typeValue} ${member.name}').join(', ');

  String toInilitializersString() =>
      map<String>((member) => '_${member.name} = ${member.name}').join(', ');
}
