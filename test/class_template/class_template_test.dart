import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart' hide Element;
import 'package:openapi_client_builder/src/schema/class_template.dart';
import 'package:test/test.dart';
import 'package:openapi_client_builder/src/extensions/element_extensions.dart';

void main() {
  group('ClassTemplate', () {
    test('accurately parses tables from the spec', () async {
      final tableString =
          await File('test/data/markdown/path_item_table.md').readAsString();

      final tags = parse(markdownToHtml(tableString))
          .documentElement!
          .querySelectorAll('h4');

      final classNameTag = tags.elementAt(0);

      var classCommentTags = <Element>[];
      var nextTag = classNameTag.nextElementSibling;
      while (nextTag != null && nextTag.isNotTableHeader) {
        // Keep adding to the commentTags and moving on.
        classCommentTags.add(nextTag);
        nextTag = nextTag.nextElementSibling;
      }

      final tableTag = nextTag!.nextElementSibling!;

      final classTemplate = ClassTemplate(
        classNameTag: classNameTag,
        classCommentTags: classCommentTags,
        tableTag: tableTag,
      );

      expect(classTemplate.firstMember.variableName, 'ref');

      // final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      // final openapi = OpenAPI.fromJson(jsonMap);

      // print(openapi);
    });
  });
}
