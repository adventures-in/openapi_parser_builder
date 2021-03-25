import 'package:openapi_client_builder/src/schema/types/member_type.dart';
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
  late final bool _isReference; // references may need to use ref or $ref
  late final String? _comment;
  late final MemberType _memberType;
  late final String _rawName;
  late final String _sanitizedName;

  String get typeName =>
      _isRequired ? _memberType.name : '${_memberType.name}?';
  String get rawTypeName => _memberType.name;
  String get name => _sanitizedName;
  String get rawName => _rawName;
  String? get comment => _comment;

  bool get isRequired => _isRequired;
  bool get isReference => _isReference;

  // Strings for building fromJson for List types.
  String get listParameter => _memberType.listParameter.name;
  String get listFrom => (_memberType.listParameter.isObjectOrUnion)
      ? 'json[\'$name\'].map<$listParameter>((item) => $listParameter.fromJson(item)).toList()'
      : 'json[\'$name\'].map<$listParameter>((item) => item as $listParameter).toList()';
  // If the member is not a required member, add a null check to the fromJson
  String get mapNullCheck =>
      (_isRequired) ? '' : '== null) ? null : (json[\'$name\']';
  String get objectNullCheck =>
      (_isRequired) ? '' : '(json[\'$name\'] == null) ? null :';

  // Strings for building fromJson for List types.
  String get mapParameter => _memberType.mapParameter.name;
  String get mapFrom => (_memberType.mapParameter.isObjectOrUnion)
      ? 'as Map<String, dynamic>).map<String, $mapParameter>((key, value) => MapEntry(key, $mapParameter.fromJson(value))'
      : 'as Map<String, dynamic>).map<String, $mapParameter>((key, value) => MapEntry(key, value as $mapParameter)';

  // _content = (json['content']  as Map<String, dynamic>).map<String, MediaType>((key, value) => MapEntry(key, MediaType.fromJson(value)))),
  // _callbacks = (json['callbacks'] == null) ? null : ((json['callbacks'] as Map<String, dynamic>).map<String, CallbackOrReference>((key, value) => MapEntry(key, CallbackOrReference.fromJson(value)))),

  String get firstParameter => _memberType.firstParameter.name;
  String get secondParameter => _memberType.secondParameter.name;

  String get fromJsonString {
    if (_memberType.isObjectOrUnion) {
      return '    _$name = $objectNullCheck $rawTypeName.fromJson(json[\'$name\'])';
    }

    if (_memberType.isList) {
      return '    _$name = $objectNullCheck $listFrom';
    }

    if (_memberType.isMap) {
      return '    _$name = (json[\'$name\'] $mapNullCheck $mapFrom)';
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
