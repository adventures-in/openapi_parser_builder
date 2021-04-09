import 'dart:io';

import 'package:html/parser.dart';
import 'package:markdown/markdown.dart' hide Element;
import 'package:openapi_parser_builder/src/schema/class_template.dart';
import 'package:test/test.dart';

void main() {
  group('ClassTemplate', () {
    test('accurately parses Path Item table', () async {
      final tableString =
          await File('test/data/markdown/path_item_table.md').readAsString();

      final tags = parse(markdownToHtml(tableString))
          .documentElement!
          .querySelectorAll('h4');

      final classNameTag = tags.elementAt(0);

      final classTemplate = ClassTemplate(classNameTag: classNameTag);

      // expect(classTemplate.firstMember.variableName, 'ref');
    });

    test('accurately parses Paths table', () async {
      final tableString =
          await File('test/data/markdown/paths_table.md').readAsString();

      final tags = parse(markdownToHtml(tableString))
          .documentElement!
          .querySelectorAll('h4');

      final classNameTag = tags.elementAt(0);

      final classTemplate = ClassTemplate(classNameTag: classNameTag);

      // expect(classTemplate.firstMember.variableName, 'pathsMap');
    });
  });
}
