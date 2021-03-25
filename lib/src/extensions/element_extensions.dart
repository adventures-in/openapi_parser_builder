import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/schema/member_template.dart';

extension ElementExtension on Element {
  List<MemberTemplate> toMemberTemplates() =>
      (text.split('\n')..removeRange(0, 2))
          .map<MemberTemplate>((row) => MemberTemplate(row))
          .toList();
}
