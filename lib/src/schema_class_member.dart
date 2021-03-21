import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';

/// Schema classes are created from the spec, this class holds the data used to
/// construct the members of a schema class.
class SchemaClassMember {
  SchemaClassMember(this.comment, this.type, String name)
      : _name = name.sanitize();

  final String? comment;
  final String type;
  final String _name;

  String get name => _name;
}
