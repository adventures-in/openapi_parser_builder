import 'package:openapi_client_builder_builder/src/member_type.dart';
import 'package:openapi_client_builder_builder/src/type_kind.dart';

/// Schema classes are created from the spec, this class holds the data used to
/// construct the members of a schema class.
class SchemaClassMember {
  SchemaClassMember(
      this.isRequired, this.comment, MemberType memberType, String name)
      : _memberType = memberType,
        _rawName = name {
    _sanitizedName = sanitize(name);
  }

  final bool isRequired;
  late final bool isReference;
  final String? comment;
  final MemberType _memberType;
  final String _rawName;
  late final String _sanitizedName;

  TypeKind get typeKind => _memberType.kind;
  String get typeValue =>
      isRequired ? _memberType.value : '${_memberType.value}?';
  String get typeValueWithoutNullability => _memberType.value;
  String get name => _sanitizedName;
  String get rawName => _rawName;

  String sanitize(String name) {
    final trimmed = name.trim();
    if (trimmed[0] == r'$') {
      isReference = true;
      return trimmed.substring(1);
    } else {
      isReference = false;
    }
    if (trimmed == 'in') return 'inValue';
    if (trimmed == 'enum') return 'enums';
    if (trimmed == 'default') return 'defaultValue';
    return name;
  }
}
