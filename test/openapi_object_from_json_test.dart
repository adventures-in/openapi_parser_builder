import 'dart:convert';

import 'package:openapi_client_builder_builder/output/schema_classes.dart';
import 'package:test/test.dart';

import 'data/json/app_store_connect_openapi_file.dart';

void main() {
  group('AppStore Connect OpenAPI file', () {
    // Awesome awesome;

    setUp(() {
      // awesome = Awesome();
    });

    test('parses correctly', () {
      final map = json.decode(app_store_connect_openapi_json_string)
          as Map<String, dynamic>;

      OpenAPI.fromJson(map);
    });
  });
}
