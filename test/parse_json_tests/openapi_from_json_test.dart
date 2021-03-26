import 'dart:convert';
import 'dart:io';

import 'package:openapi_client_builder/output/schema_classes.dart';
import 'package:test/test.dart';

void main() {
  group('AppStore Connect OpenAPI file', () {
    test('parses correctly', () async {
      final jsonString =
          await File('test/data/json/app-store-connect-openapi-spec.json')
              .readAsString();
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      final openapi = OpenAPI.fromJson(jsonMap);

      print(openapi);
    }, skip: true);
  });
}
