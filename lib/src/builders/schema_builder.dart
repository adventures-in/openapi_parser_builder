import 'dart:async';

import 'package:build/build.dart';
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart';
import 'package:openapi_client_builder/src/schema/class_template.dart';
import 'package:openapi_client_builder/src/state/global_set_of_union_types.dart';

class SchemaBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path.replaceAll(
        RegExp(r'input/openapi_spec.md'), 'output/schema_classes.dart');

    final outputId = AssetId(inputId.package, newPath);

    final openapiSpecREADME = await buildStep.readAsString(inputId);

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
