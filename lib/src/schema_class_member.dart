import 'package:openapi_client_builder_builder/src/extensions/string_extensions.dart';

/// Schema classes are created from the spec, this class holds the data used to
/// construct the members of a schema class.
class SchemaClassMember {
  SchemaClassMember(this.isRequired, this.comment, String type, String name)
      : _type = type,
        _name = name.sanitize();

  final bool isRequired;
  final String? comment;
  final String _type;
  final String _name;

  String get type => isRequired ? _type : '$_type?';
  String get name => _name;
}
