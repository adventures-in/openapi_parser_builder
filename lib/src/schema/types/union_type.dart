import 'package:openapi_schema_builder/src/schema/types/member_type.dart';
import 'package:openapi_schema_builder/src/enums/type_category.dart';

class UnionType extends MemberType {
  UnionType(String value, {List<MemberType>? parameterTypes})
      : firstVariableName = parameterTypes!.first.variableName,
        secondVariableName = parameterTypes.last.variableName,
        firstClassName = parameterTypes.first.name,
        secondClassName = parameterTypes.last.name,
        super(value, TypeCategory.union, parameterTypes: parameterTypes) {
    ;
  }

  final String firstClassName;
  final String secondClassName;
  final String firstVariableName;
  final String secondVariableName;
  String get fromJson => (secondClassName == 'RuntimeExpression')
      ? '$secondClassName(json as String)'
      : '$secondClassName(ref: json[\'\\\$ref\'])';

  String get classTemplate => '''

///
class $name {
  $name(this.$firstVariableName, this.$secondVariableName);

  $firstClassName? $firstVariableName;
  $secondClassName? $secondVariableName;

  $name.fromJson(Map<String, dynamic> json) :
    $firstVariableName = (json[\'\\\$ref\'] == null) ? $firstClassName.fromJson(json) : null,
    $secondVariableName = (json[\'\\\$ref\'] == null) ? null : $fromJson;
}
''';
}
