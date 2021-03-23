import 'dart:io';

import 'package:test/test.dart';
import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';

void main() {
  group('BuilderClassTemplate', () {
    setUp(() {
      // awesome = Awesome();
    });

    test('parses html correctly', () async {
      final openapiSpecHTMLString =
          await File('test/data/openapi_spec.html').readAsString();
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
