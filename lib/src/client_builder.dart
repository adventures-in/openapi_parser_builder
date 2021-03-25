import 'dart:async';

import 'package:build/build.dart';
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart';
import 'package:openapi_client_builder/src/schema/utility_functions.dart';
import 'package:openapi_client_builder/src/state/global_set_of_union_types.dart';

class ClientBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path.replaceAll(
        RegExp(r'input/openapi_spec.md'), 'output/schema_classes.dart');

    final outputId = AssetId(inputId.package, newPath);

    final openapiSpecREADME = await buildStep.readAsString(inputId);

    final templates =
        extractClassTemplates(parse(markdownToHtml(openapiSpecREADME)));

    var combinedOutput = '';
    for (final template in templates) {
      combinedOutput += template.output;
    }

    combinedOutput += '''
 
class RuntimeExpression {
  RuntimeExpression(this.expression);

  String expression;

  RuntimeExpression.fromJson(Map<String, dynamic> json) : expression = json as String;
}

class Any {
  dynamic value;

  Any.fromJson(Map<String, dynamic> json) : value = json;
}
''';

    for (final unionType in globalSetOfUnionTypes) {
      combinedOutput += unionType.classTemplate;
    }

    await buildStep.writeAsString(outputId, combinedOutput);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        'input/openapi_spec.md': ['output/schema_classes.dart']
      };
}
