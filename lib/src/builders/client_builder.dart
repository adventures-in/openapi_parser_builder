import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:openapi_client_builder/output/schema_classes.dart';

class ClientBuilder implements Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newPath = inputId.path.replaceAll(
        RegExp(r'input/app-store-connect-openapi.json'), 'output/client.dart');

    final outputId = AssetId(inputId.package, newPath);

    final jsonString = await buildStep.readAsString(inputId);
    final jsonMap = json.decode(jsonString);
    final openapi = OpenAPI.fromJson(jsonMap);

    var combinedOutput = '';
    // for (final template in templates) {
    //   combinedOutput += template.output;
    // }

    combinedOutput += '''
 
// Response response;
Dio dio = new Dio();
var response = await dio.get("/test?id=12&name=wendu");

// Optionally the request above could also be done as
response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
print(response.data.toString());
}
''';

    await buildStep.writeAsString(outputId, combinedOutput);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        'input/openapi_spec.md': ['output/schema_classes.dart']
      };
}
