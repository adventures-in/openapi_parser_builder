import 'dart:convert';
import 'dart:io';

import 'package:openapi_client_builder/output/schema_classes.dart';
import 'package:test/test.dart';

void main() {
  group('Example paths json', () {
    test('parses correctly', () async {
      final jsonString = await File('test/data/json/paths.json').readAsString();
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      final paths = Paths.fromJson(jsonMap['paths']);

      // expect(paths.path?.entries.length, 174);
    });
  });
}
