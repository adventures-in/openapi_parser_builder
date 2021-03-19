import 'dart:async';

import 'package:build/build.dart';

class ClientBuilderBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path
        .replaceAll(RegExp(r'openapi_spec.md'), 'builder_classes.dart');
    print(newPath);
    final outputId = AssetId(inputId.package, newPath);

    final contents = await buildStep.readAsString(inputId);

    await buildStep.writeAsString(outputId, contents);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        'openapi_spec.md': ['builder_classes.dart']
      };
}
