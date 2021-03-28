import 'package:openapi_schema_builder/src/schema/member_template.dart';
import 'package:test/test.dart';

void main() {
  group('MemberTemplate', () {
    test('accurately parses strings from tables in the spec', () async {
      final row = r'''
      $ref | string | Allows for an external definition of this path item. The referenced structure MUST be in the format of a Path Item Object. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is undefined.
      ''';

      final memberTemplate = MemberTemplate(row);

      expect(memberTemplate.variableName, 'ref');
    });

    test('sanitizes variable name', () async {
      expect(MemberTemplate(r'{a} | b | c').variableName, 'a');
      expect(MemberTemplate(r'$a | b | c').variableName, 'a');
    });
  });
}
