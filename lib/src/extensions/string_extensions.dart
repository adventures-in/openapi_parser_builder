import 'package:openapi_parser_builder/src/enums/fields_type.dart';

extension StringExtension on String {
  FieldsType toFieldsType() {
    if (this == 'Fixed Fields') return FieldsType.fixed;
    if (this == 'Patterned Fields') return FieldsType.patterned;
    return FieldsType.unknown;
  }
}
