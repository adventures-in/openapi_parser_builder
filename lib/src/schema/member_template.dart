import 'package:openapi_client_builder/src/schema/types/member_type.dart';
import 'package:openapi_client_builder/src/enums/type_category.dart';

/// Schema classes are created from the spec, this class holds the data used to
/// construct the members of a schema class.
class MemberTemplate {
  MemberTemplate(
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

  TypeCategory get typeCategory => _memberType.category;
  String get typeValue =>
      isRequired ? _memberType.value : '${_memberType.value}?';
  String get typeValueWithoutNullability => _memberType.value;
  String get name => _sanitizedName;
  String get rawName => _rawName;

  // Strings for building fromJson for List types.
  String get listParameter => _memberType.listParameter.value;
  String get listParameterFromJson => (_memberType.listParameter.isObject)
      ? '$listParameter.fromJson(json)'
      : 'json[\'$name\']';
  String get listCast => (_memberType.listParameter.isObject)
      ? ' as List<dynamic>).map<$listParameter>((json) => $listParameterFromJson).toList()'
      : '.cast<$listParameter>())';
  // If the member is not a required member, add a null check to the fromJson
  String get listNullCheck =>
      (isRequired) ? '' : '== null) ? null : (json[\'$name\']';
  String get objectNullCheck =>
      (isRequired) ? '' : '(json[\'$name\'] == null) ? null :';

  // Strings for building fromJson for List types.
  String get mapParameter => _memberType.mapParameter.value;
  String get mapCast => (_memberType.listParameter.isObject)
      ? '.map<String, $mapParameter>((entry) => entry)'
      : '.cast<String, $mapParameter>())';

  String get firstParameter => _memberType.firstParameter.value;
  String get secondParameter => _memberType.secondParameter.value;

  String get fromJsonString {
    if (typeCategory == TypeCategory.object ||
        typeCategory == TypeCategory.union) {
      return '    _$name = $objectNullCheck $typeValueWithoutNullability.fromJson(json[\'$name\'])';
    }

    if (typeCategory == TypeCategory.list) {
      return '    _$name = (json[\'$name\'] $listNullCheck$listCast';
    }

    if (typeCategory == TypeCategory.map) {
      '    _$name = (json[\'$name\'] $listNullCheck$mapCast';
    }

    return '    _$name = json[\'$name\']';
  }

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
