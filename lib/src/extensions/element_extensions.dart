import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/schema/member_template.dart';

extension ElementExtension on Element {
  /// The Element is assumed to be a markdown table with three columns and a
  /// title.
  ///
  /// Split the table into rows and remove the first two (title and markdown
  /// table description) then map each row into a MemberTemplate.
  List<MemberTemplate> toMemberTemplates() =>
      (text.split('\n')..removeRange(0, 2))
          .map<MemberTemplate>((row) => MemberTemplate(row))
          .toList();

  bool get isNotTableHeader =>
      text != 'Fixed Fields' && text != 'Patterned Fields';
}
