import 'dart:async';

import 'package:build/build.dart';
import 'package:markdown/markdown.dart';
import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';
import 'package:openapi_client_builder_builder/src/state/union_types_set.dart';

class ClientBuilderBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path.replaceAll(
        RegExp(r'input/openapi_spec.md'), 'output/schema_classes.dart');

    final outputId = AssetId(inputId.package, newPath);

    final contents = await buildStep.readAsString(inputId);

    final html = markdownToHtml(contents);

    final templates = html.toTemplates();

    var combinedOutput = '';
    for (final template in templates) {
      combinedOutput += template.output;
    }

    combinedOutput += '''

  /// 
class RuntimeExpression {
  RuntimeExpression();
}
''';

    for (final unionType in unionTypes) {
      combinedOutput += '''

/// 
class $unionType {
  $unionType();

  $unionType.fromJson(Map<String, dynamic> json);
}
''';
    }

    await buildStep.writeAsString(outputId, combinedOutput);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        'input/openapi_spec.md': ['output/schema_classes.dart']
      };
}
