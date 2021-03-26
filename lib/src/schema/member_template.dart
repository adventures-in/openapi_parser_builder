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
    _rawVariableName = rowParts.first.trim();
    _sanitizedName = sanitize(_rawVariableName);
  }

  MemberTemplate._({
    required bool isRequired,
    required String? comment,
    required MemberType memberType,
    required String rawVariableName,
    required String sanitizedName,
  }) {
    _comment = comment;
    _isRequired = isRequired;
    _memberType = memberType;
    _rawVariableName = rawTypeName;
    _sanitizedName = sanitizedName;
  }

  MemberTemplate _copyWith(
          {bool? isRequired,
          String? comment,
          MemberType? memberType,
          String? rawVariableName,
          String? sanitizedName}) =>
      MemberTemplate._(
          isRequired: isRequired ?? _isRequired,
          comment: comment ?? _comment,
          memberType: memberType ?? _memberType,
          rawVariableName: rawVariableName ?? _rawVariableName,
          sanitizedName: sanitizedName ?? _sanitizedName);

  late final bool _isRequired;
  late final String? _comment;
  late final MemberType _memberType;
  late final String _rawVariableName;
  late final String _sanitizedName;

  MemberTemplate convertToPatternedField() => _copyWith(
      sanitizedName: '${_sanitizedName}Map',
      memberType: MemberType(
          'Map<String, ${_memberType.name}>', TypeCategory.map,
          parameterTypes: [
            MemberType('String', TypeCategory.primitive),
            _memberType
          ]));

  String get typeName =>
      _isRequired ? _memberType.name : '${_memberType.name}?';
  String get rawTypeName => _memberType.name;
  String get variableName => _sanitizedName;
  String get rawVariableName => _rawVariableName;
  String? get comment => _comment;

  bool get isRequired => _isRequired;

  // Strings for building fromJson for List types.
  String get listParameter => _memberType.listParameter.name;
  String get listFrom => (_memberType.listParameter.isObjectOrUnion)
      ? 'json[\'$variableName\'].map<$listParameter>((item) => $listParameter.fromJson(item)).toList()'
      : 'json[\'$variableName\'].map<$listParameter>((item) => item as $listParameter).toList()';
  // If the member is not a required member, add a null check to the fromJson
  String get mapNullCheck =>
      (_isRequired) ? '' : '== null) ? null : (json[\'$variableName\']';
  String get objectNullCheck =>
      (_isRequired) ? '' : '(json[\'$variableName\'] == null) ? null :';

  // Strings for building fromJson for List types.
  String get mapParameter => _memberType.mapParameter.name;
  String get mapFrom => (_memberType.mapParameter.isObjectOrUnion)
      ? 'as Map<String, dynamic>).map<String, $mapParameter>((key, value) => MapEntry(key, $mapParameter.fromJson(value))'
      : 'as Map<String, dynamic>).map<String, $mapParameter>((key, value) => MapEntry(key, value as $mapParameter)';

  String get fromJsonString {
    switch (_memberType.category) {
      case TypeCategory.object:
        return '    _$variableName = $objectNullCheck $rawTypeName.fromJson(json[\'$variableName\'])';
      case TypeCategory.union:
        return '    _$variableName = $objectNullCheck $rawTypeName.fromJson(json[\'$variableName\'])';
      case TypeCategory.list:
        return '    _$variableName = $objectNullCheck $listFrom';
      case TypeCategory.map:
        return '    _$variableName = (json[\'$variableName\'] $mapNullCheck $mapFrom)';
      default:
        return '    _$variableName = json[\'$variableName\']';
    }
  }

  // remove spaces, any $ or { or } symbols and replace any dart keywords
  String sanitize(String name) {
    var trimmed = name.trim();
    trimmed = trimmed.replaceAll(RegExp(r'{|}|\$'), '');
    if (trimmed == 'in') return 'inValue';
    if (trimmed == 'enum') return 'enums';
    if (trimmed == 'default') return 'defaultValue';
    return trimmed;
  }
}
