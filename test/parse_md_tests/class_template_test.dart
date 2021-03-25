import 'dart:io';

import 'package:html/parser.dart';
import 'package:markdown/markdown.dart';
import 'package:openapi_client_builder/src/schema/utility_functions.dart';
import 'package:test/test.dart';

void main() {
  group('ClassTemplate', () {
    test('parses the openapi spec correctly', () async {
      final openapiSpecREADME =
          await File('lib/input/openapi_spec.md').readAsString();

      final templates =
          extractClassTemplates(parse(markdownToHtml(openapiSpecREADME)));

      var combinedOutput = '';
      for (final template in templates) {
        combinedOutput += template.output;
      }

      print(combinedOutput);
    });
  });
}
