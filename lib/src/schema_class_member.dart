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

  // Strings for building fromJson for List types.
  String get listParameter => _memberType.listParameter;
  String get listParameterFromJson => (_memberType.listParamterIsObject)
      ? '$listParameter.fromJson(json)'
      : 'json[\'$name\']';
  String get listCast => (_memberType.listParamterIsObject)
      ? ' as List<dynamic>).map<$listParameter>((json) => $listParameterFromJson).toList()'
      : '.cast<$listParameter>())';
  // If the member is not a required member, add a null check to the fromJson
  String get listNullCheck =>
      (isRequired) ? '' : '== null) ? null : (json[\'$name\']';
  String get objectNullCheck =>
      (isRequired) ? '' : '(json[\'$name\'] == null) ? null :';

  String get fromJsonString => (typeKind == TypeKind.object ||
          typeKind == TypeKind.union)
      ? '    _$name = $objectNullCheck $typeValueWithoutNullability.fromJson(json[\'$name\'])'
      : typeKind == TypeKind.list
          ? '    _$name = (json[\'$name\'] $listNullCheck$listCast'
          : '    _$name = json[\'$name\']';

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
