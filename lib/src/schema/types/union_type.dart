import 'package:openapi_client_builder/src/schema/types/member_type.dart';
import 'package:openapi_client_builder/src/enums/type_category.dart';

class UnionType extends MemberType {
  UnionType(String value, {List<MemberType>? parameterTypes})
      : firstVariableName = parameterTypes!.first.variableName,
        secondVariableName = parameterTypes.last.variableName,
        firstClassName = parameterTypes.first.value,
        secondClassName = parameterTypes.last.value,
        super(value, TypeCategory.union, parameterTypes: parameterTypes) {
    ;
  }

  final String firstClassName;
  final String secondClassName;
  final String firstVariableName;
  final String secondVariableName;

  String get classTemplate => '''

///
class $value {
  $value(this.$firstVariableName, this.$secondVariableName);

  $firstClassName? $firstVariableName;
  $secondClassName? $secondVariableName;

  $value.fromJson(Map<String, dynamic> json) :
    $firstVariableName = (json[\'$firstVariableName}\'] == null) ? null : $firstClassName.fromJson(json[\'$firstVariableName\']),
    $secondVariableName = (json[\'\\\$ref\'] == null) ? null : $secondClassName.fromJson(json[\'\\\$ref\']);
}
''';
}
