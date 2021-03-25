import 'dart:convert';
import 'dart:io';

import 'package:openapi_client_builder/output/schema_classes.dart';
import 'package:test/test.dart';

void main() {
  group('Example PathItem json', () {
    test('parses correctly', () async {
      final jsonString = await File('test/data/path_item.json').readAsString();
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      final pathItem = PathItem.fromJson(jsonMap);

      expect(pathItem.patch, isNot(null));
      expect(pathItem.patch!.tags!.first, 'AgeRatingDeclarations');
      expect(
          pathItem.patch!.operationId, 'ageRatingDeclarations-update_instance');
      expect(pathItem.patch!.requestBody, isNot(null));
    });
  });
}
