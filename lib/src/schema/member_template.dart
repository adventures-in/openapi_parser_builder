import 'package:openapi_client_builder/src/schema/types/member_type.dart';
import 'package:openapi_client_builder/src/enums/type_category.dart';
import 'package:openapi_client_builder/src/extensions/list_extensions.dart';

/// Schema classes are created from the spec, this class holds the data used to
/// construct the members of a schema class.
class MemberTemplate {
  MemberTemplate(String tableRow) {
    final rowParts = tableRow.split(' | ');
    _comment = rowParts.elementAtOrNull(2)?.trim();
    _isRequired = _comment?.startsWith('REQUIRED') == true;
    _memberType = MemberType.from(rowParts.elementAt(1).trim());
    _rawName = rowParts.first.trim();
    _sanitizedName = sanitize(_rawName);
  }

  late final bool _isRequired;
  late final bool _isReference;
  late final String? _comment;
  late final MemberType _memberType;
  late final String _rawName;
  late final String _sanitizedName;

  TypeCategory get typeCategory => _memberType.category;
  String get typeValue =>
      _isRequired ? _memberType.value : '${_memberType.value}?';
  String get typeValueWithoutNullability => _memberType.value;
  String get name => _sanitizedName;
  String get rawName => _rawName;
  String? get comment => _comment;

  bool get isRequired => _isRequired;

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
      (_isRequired) ? '' : '== null) ? null : (json[\'$name\']';
  String get objectNullCheck =>
      (_isRequired) ? '' : '(json[\'$name\'] == null) ? null :';

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
      _isReference = true;
      return trimmed.substring(1);
    } else {
      _isReference = false;
    }
    if (trimmed == 'in') return 'inValue';
    if (trimmed == 'enum') return 'enums';
    if (trimmed == 'default') return 'defaultValue';
    return name;
  }
}
