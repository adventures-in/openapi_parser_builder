import 'dart:convert';
import 'dart:io';

import 'package:openapi_parser_builder/output/schema_classes.dart';
import 'package:test/test.dart';

void main() {
  group('Example servers json', () {
    test('parses correctly', () async {
      final jsonString =
          await File('test/data/json/servers.json').readAsString();
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      final servers = (jsonMap['servers'] as List<dynamic>)
          .map<Server>((json) => Server.fromJson(json))
          .toList();

      expect(servers.first.url, 'https://api.appstoreconnect.apple.com/');
    });
  });
}
