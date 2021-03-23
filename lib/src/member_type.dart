import 'package:openapi_client_builder_builder/src/type_kind.dart';

class MemberType {
  MemberType(this.value, this.kind, {List<MemberType>? parameterTypes})
      : _parameterTypes = (parameterTypes == null) ? [] : parameterTypes;
  String value;
  TypeKind kind;

  final List<MemberType> _parameterTypes;

  String get listParameter => _parameterTypes.first.value;
  bool get listParamterIsObject =>
      _parameterTypes.first.kind == TypeKind.object;
}
