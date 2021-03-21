import 'package:html/parser.dart';
import 'package:openapi_client_builder_builder/src/templates/builder_class_template.dart';
import 'package:test/test.dart';

import 'data/openapi_spec_html.dart';

void main() {
  group('BuilderClassTemplate', () {
    setUp(() {
      // awesome = Awesome();
    });

    test('parses html correctly', () {
      var document = parse(openapiSpecHTMLString);

      final tags = document.querySelectorAll('h4');
      tags.removeAt(0); // the first item is the Version

      // final tag = tags.elementAt(1);

      final templates = <BuilderClassTemplate>[];
      for (final classNameTag in tags) {
        final subheadingInQuestionTag =
            classNameTag.nextElementSibling?.nextElementSibling;
        final classCommentTag = classNameTag.nextElementSibling;
        final tableTag = classNameTag
            .nextElementSibling?.nextElementSibling?.nextElementSibling;
        if (subheadingInQuestionTag != null &&
            subheadingInQuestionTag.text == 'Fixed Fields' &&
            classCommentTag != null &&
            tableTag != null) {
          final tableRows = tableTag.text.split('\n')..removeAt(0)..removeAt(0);

          // print(tableRows);

          templates.add(BuilderClassTemplate(
              classNameTag: classNameTag,
              classCommentTag: classCommentTag,
              tableRows: tableRows));
        }
      }

      var combinedOutput = '';
      for (final template in templates) {
        combinedOutput += template.output;
      }

      print(combinedOutput);

      // expect(awesome.isAwesome, isTrue);
    });
  });
}
