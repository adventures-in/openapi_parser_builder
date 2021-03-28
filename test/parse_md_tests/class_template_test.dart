import 'dart:io';

import 'package:html/parser.dart';
import 'package:markdown/markdown.dart';
import 'package:openapi_schema_builder/src/schema/class_template.dart';
import 'package:test/test.dart';

void main() {
  group('ClassTemplate', () {
    // This tests the whole process of taking the full markdown and parsing into
    // template classes.
    test('parses the openapi spec correctly', () async {
      final openapiSpecREADME =
          await File('lib/input/openapi_spec.md').readAsString();

      // Convert markdown to a html string and parse to a data structure.
      final document = parse(markdownToHtml(openapiSpecREADME));

      // Extract class name tags - each h4 tag corresponds to a schema object,
      // apart from the first item which is the Version.
      final templates = (document.querySelectorAll('h4')..removeAt(0))
          .map<ClassTemplate>((tag) => ClassTemplate(classNameTag: tag))
          .toList();

      var combinedOutput = '';
      for (final template in templates) {
        combinedOutput += template.output;
      }

      print(combinedOutput);
    });
  });
}
