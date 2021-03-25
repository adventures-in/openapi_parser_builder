import 'package:openapi_client_builder/src/enums/type_category.dart';
import 'package:openapi_client_builder/src/schema/types/union_type.dart';
import 'package:openapi_client_builder/src/state/global_set_of_union_types.dart';

class MemberType {
  MemberType(this.name, this.category, {List<MemberType>? parameterTypes})
      : _parameterTypes = (parameterTypes == null) ? [] : parameterTypes;

  String name;
  TypeCategory category;

  final List<MemberType> _parameterTypes;

  static MemberType from(String s) {
    final trimmed = s.trim();

    // Convert any simple types.
    if (trimmed == 'string') {
      return MemberType('String', TypeCategory.primitive);
    }
    if (trimmed == 'boolean') {
      return MemberType('bool', TypeCategory.primitive);
    }
    if (trimmed == 'Any') {
      return MemberType('Any', TypeCategory.any);
    }
    if (trimmed == '{expression}') {
      return MemberType('RuntimeExpression', TypeCategory.object);
    }

    // Convert any Map types found, recursively converting parameter types.
    if (trimmed.length > 4 && trimmed.substring(0, 4) == 'Map[') {
      final insideOfMap = trimmed.substring(4, trimmed.length - 1);
      final insideTypes = insideOfMap.split(', ');
      if (insideTypes.length != 2) {
        throw 'Constructing MemberType: $trimmed had type Map but ${insideTypes.length} paramters.';
      }
      return MemberType(
          'Map<${MemberType.from(insideTypes.first).name}, ${MemberType.from(insideTypes.last).name}>',
          TypeCategory.map,
          parameterTypes: [
            MemberType.from(insideTypes.first),
            MemberType.from(insideTypes.last)
          ]);
    }

    // Convert any List types found, recursively converting parameter types.
    if (trimmed[0] == '[' && trimmed[trimmed.length - 1] == ']') {
      var s = trimmed.replaceAll('[', '');
      s = s.replaceAll(']', '');
      return MemberType('List<${MemberType.from(s).name}>', TypeCategory.list,
          parameterTypes: [MemberType.from(s)]);
    }

    // Convert any Union types found.
    final unionObjects = trimmed.split(r' \| ');
    if (unionObjects.length == 2) {
      final firstParameterType = MemberType.from(unionObjects.first);
      final secondParameterType = MemberType.from(unionObjects.last);
      final unionType = UnionType(
          '${firstParameterType.name}Or${secondParameterType.name}',
          parameterTypes: [firstParameterType, secondParameterType]);
      globalSetOfUnionTypes.add(unionType);
      return unionType;
    }

    // Convert any Object types.
    final objectWords = trimmed.split(' ');
    if (objectWords.last == 'Object') {
      return MemberType(
          (trimmed.split(' ')..removeLast()).join(), TypeCategory.object);
    }

    // If nothing was found, return an unkown type.
    return MemberType('/// __${trimmed}__', TypeCategory.unknown);
  }

  MemberType get listParameter => _parameterTypes.first;
  MemberType get mapParameter => _parameterTypes.last;
  MemberType get firstParameter => _parameterTypes.first;
  MemberType get secondParameter => _parameterTypes.last;

  bool get isObject => category == TypeCategory.object;
  bool get isList => category == TypeCategory.list;
  bool get isMap => category == TypeCategory.map;
  bool get isUnion => category == TypeCategory.union;
  bool get isObjectOrUnion =>
      category == TypeCategory.object || category == TypeCategory.union;

  String get variableName => (category == TypeCategory.any)
      ? 'any'
      : name[0].toLowerCase() + name.substring(1);

  // We want state based equivalence so Set behaves as expected. The value
  // eg. String or CallbackOrReference, uniquely identifies the MemberType

  @override
  bool operator ==(o) => o is MemberType && o.name == name;

  @override
  int get hashCode => name.hashCode;
}
