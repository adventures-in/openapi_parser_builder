import 'package:test/test.dart';
import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';

import 'data/openapi_spec_html.dart';

void main() {
  group('BuilderClassTemplate', () {
    setUp(() {
      // awesome = Awesome();
    });

    test('parses html correctly', () {
      final templates = openapiSpecHTMLString.toTemplates();

      var combinedOutput = '';
      for (final template in templates) {
        combinedOutput += template.output;
      }

      print(combinedOutput);

      // expect(awesome.isAwesome, isTrue);
    });
  });
}
