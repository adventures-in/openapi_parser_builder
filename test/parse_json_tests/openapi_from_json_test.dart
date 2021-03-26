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

      // OpenAPI info member
      expect(openapi.info is Info, true);
      final info = openapi.info;
      expect(info.title, 'App Store Connect API');
      expect(info.description, null);
      expect(info.termsOfService, null);
      expect(info.contact, null);
      expect(info.license, null);
      expect(info.version, '1.2');

      // OpenAPI servers member
      expect(openapi.servers is List<Server>, true);
      final server = openapi.servers!.first;
      expect(server.description, null);
      expect(server.variables, null);
      expect(server.url, 'https://api.appstoreconnect.apple.com/');

      // OpenAPI externalDocs member
      expect(openapi.externalDocs is ExternalDocumentation, true);
      final externalDocs = openapi.externalDocs!;
      expect(externalDocs.description, 'App Store Connect API Documentation');
      expect(externalDocs.url,
          'https://developer.apple.com/documentation/appstoreconnectapi');

      // OpenAPI paths member
      expect(openapi.paths is Paths, true);
    });
  });
}
