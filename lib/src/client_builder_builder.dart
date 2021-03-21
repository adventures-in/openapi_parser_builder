import 'dart:async';

import 'package:build/build.dart';
import 'package:html/parser.dart' show parse;
import 'package:markdown/markdown.dart';
import 'package:openapi_client_builder_builder/src/templates/builder_class_template.dart';

class ClientBuilderBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path
        .replaceAll(RegExp(r'openapi_spec.md'), 'builder_classes.dart');

    final outputId = AssetId(inputId.package, newPath);

    final contents = await buildStep.readAsString(inputId);

    final html = markdownToHtml(contents);
    var document = parse(html);

    final tags = document.querySelectorAll('h4');
    tags.removeAt(0); // the first item is the Version

    final templates = <BuilderClassTemplate>[];
    for (final classNameTag in tags) {
      final subheadingInQuestionTag =
          classNameTag.nextElementSibling?.nextElementSibling;
      final classCommentTag = classNameTag.nextElementSibling;
      final tableTag = classNameTag
          .nextElementSibling?.nextElementSibling?.nextElementSibling;
      if (subheadingInQuestionTag != null &&
          (subheadingInQuestionTag.text == 'Fixed Fields' ||
              subheadingInQuestionTag.text == 'Patterned Fields') &&
          classCommentTag != null &&
          tableTag != null) {
        final tableRows = tableTag.text.split('\n')..removeAt(0)..removeAt(0);
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

    await buildStep.writeAsString(outputId, combinedOutput);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        'openapi_spec.md': ['builder_classes.dart']
      };
}
