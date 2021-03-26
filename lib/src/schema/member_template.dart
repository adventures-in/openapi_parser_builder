import 'package:openapi_client_builder/src/enums/type_category.dart';
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

    // clean up variable names, leave the raw original for the json keys
    final trimmed = rowParts.first.trim();
    _variableName = sanitize(trimmed);
    // we need to add a slash to escape the $ in $ref
    _rawVariableName = trimmed.replaceAll(RegExp(r'\$'), r'\$');
  }

  MemberTemplate._({
    required bool isRequired,
    required String? comment,
    required MemberType memberType,
    required String rawVariableName,
    required String variableName,
  }) {
    _comment = comment;
    _isRequired = isRequired;
    _memberType = memberType;
    _rawVariableName = rawTypeName;
    _variableName = variableName;
  }

  MemberTemplate _copyWith(
          {bool? isRequired,
          String? comment,
          MemberType? memberType,
          String? rawVariableName,
          String? variableName}) =>
      MemberTemplate._(
          isRequired: isRequired ?? _isRequired,
          comment: comment ?? _comment,
          memberType: memberType ?? _memberType,
          rawVariableName: rawVariableName ?? _rawVariableName,
          variableName: variableName ?? _variableName);

  late final bool _isRequired;
  late final String? _comment;
  late final MemberType _memberType;
  late final String _rawVariableName;
  late final String _variableName;

  MemberTemplate convertToPatternedField() => _copyWith(
      isRequired: true,
      variableName: '${_variableName}Map',
      memberType: MemberType(
          'Map<String, ${_memberType.name}>', TypeCategory.map,
          patterned: true,
          parameterTypes: [
            MemberType('String', TypeCategory.primitive),
            _memberType
          ]));

  String get typeName =>
      _isRequired ? _memberType.name : '${_memberType.name}?';
  String get rawTypeName => _memberType.name;
  String get variableName => _variableName;
  String get rawVariableName => _rawVariableName;
  String? get comment => _comment;

  bool get isRequired => _isRequired;

  // Strings for building fromJson for List types.
  String get listParameter => _memberType.listParameter.name;
  String get listFrom => (_memberType.listParameter.isObjectOrUnion)
      ? 'json[\'$rawVariableName\'].map<$listParameter>((item) => $listParameter.fromJson(item)).toList()'
      : 'json[\'$rawVariableName\'].map<$listParameter>((item) => item as $listParameter).toList()';
  // If the member is not a required member, add a null check to the fromJson
  String get objectNullCheck =>
      (_isRequired) ? '' : '(json[\'$rawVariableName\'] == null) ? null :';

  // Strings for building fromJson for Map types.
  MemberType get mapSubtype => _memberType.mapParameter;
  String get mapSubtypeName => _memberType.mapParameter.name;
  String get mapNullCheck =>
      (_isRequired) ? '' : '(json[\'$rawVariableName\'] == null) ? null : ';
  String get newMapEntry => (_memberType.mapParameter.isObjectOrUnion)
      ? 'MapEntry(key, $mapSubtypeName.fromJson(value))'
      : (_memberType.mapParameter.isList)
          ? 'MapEntry(key, (value as List<dynamic>).map<${mapSubtype.listParameter.name}>((item) => item as ${mapSubtype.listParameter.name}).toList())'
          : 'MapEntry(key, value as $mapSubtypeName)';
  String get mapCast => 'as Map<String, dynamic>)';
  String get mapFromJsonPart =>
      '.map<String, $mapSubtypeName>((key, value) => $newMapEntry)';
  String get jsonForMap => _memberType.isPatterned
      ? 'json'
      : '(json[\'$rawVariableName\'] as Map<String, dynamic>)';

  String get fromJsonString {
    switch (_memberType.category) {
      case TypeCategory.object:
        return '    _$variableName = $objectNullCheck $rawTypeName.fromJson(json[\'$rawVariableName\'])';
      case TypeCategory.union:
        return '    _$variableName = $objectNullCheck $rawTypeName.fromJson(json[\'$rawVariableName\'])';
      case TypeCategory.list:
        return '    _$variableName = $objectNullCheck $listFrom';
      case TypeCategory.map:
        return '    _$variableName = $mapNullCheck$jsonForMap$mapFromJsonPart';
      default:
        return '    _$variableName = json[\'$rawVariableName\']';
    }
  }

  // remove spaces, any $ or { or } symbols and replace any dart keywords
  String sanitize(String name) {
    final checkedName = name.replaceAll(RegExp(r'{|}|\$'), '');
    if (checkedName == 'required') return 'isRequired';
    if (checkedName == 'in') return 'inValue';
    if (checkedName == 'get') return 'getValue';
    if (checkedName == 'enum') return 'enums';
    if (checkedName == 'default') return 'defaultValue';
    return checkedName;
  }
}
