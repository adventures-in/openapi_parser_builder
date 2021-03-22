import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:openapi_client_builder_builder/src/enums/fields_type.dart';
import 'package:openapi_client_builder_builder/src/schema_class_template.dart';
import 'package:openapi_client_builder_builder/src/state/union_types_set.dart';

extension StringExtension on String {
  String toDartType() {
    final trimmedThis = trim();

    // Convert any simple types.
    if (trimmedThis == 'string') return 'String';
    if (trimmedThis == 'boolean') return 'bool';
    if (trimmedThis == 'Any') return 'dynamic';
    if (trimmedThis == '{expression}') return 'RuntimeExpression';

    // Convert any Map types found, recursively converting parameter types.
    if (trimmedThis.length > 4 && trimmedThis.substring(0, 4) == 'Map[') {
      final insideOfMap = trimmedThis.substring(4, trimmedThis.length - 1);
      final insideTypes = insideOfMap.split(', ');
      return 'Map<${insideTypes.first.toDartType()}, ${insideTypes.last.toDartType()}>';
    }

    // Convert any List types found, recursively converting parameter types.
    if (trimmedThis[0] == '[' && trimmedThis[length - 1] == ']') {
      var s = trimmedThis.replaceAll('[', '');
      s = s.replaceAll(']', '');
      return 'List<${s.toDartType()}>';
    }

    // Convert any Union types found.
    final unionObjects = trimmedThis.split(r' \| ');
    if (unionObjects.length == 2) {
      final unionType = unionObjects.first.toDartType() +
          'Or' +
          unionObjects.last.toDartType();
      unionTypes.add(unionType);
      return unionType;
    }

    final objectWords = trimmedThis.split(' ');
    if (objectWords.last == 'Object') {
      return (trimmedThis.split(' ')..removeLast()).join();
    }
    return '/// __${this}__';
  }

  String sanitize() {
    final trimmedThis = trim();
    if (trimmedThis == 'in') return 'inValue';
    if (trimmedThis == 'enum') return 'enums';
    if (trimmedThis == 'default') return 'defaultValue';
    return this;
  }

  List<SchemaClassTemplate> toTemplates() {
    final list = <SchemaClassTemplate>[];

    // Extract the relevant tags - every schema starts with a h4 tag
    final document = parse(this);
    final tags = document.querySelectorAll('h4');
    tags.removeAt(0); // the first item is the Version

    for (final classNameTag in tags) {
      // Move to the next sibling till we get a h5 tag
      var classCommentTags = <Element>[];
      var nextTag = classNameTag.nextElementSibling;
      while (nextTag != null && nextTag.localName != 'h5') {
        classCommentTags.add(nextTag);
        nextTag = nextTag.nextElementSibling;
      }

      // If we don't have the right subheading, this is not a schema item.
      if (nextTag == null ||
          (nextTag.text != 'Fixed Fields' &&
              nextTag.text != 'Patterned Fields')) {
        continue;
      }

      final tableTag = nextTag.nextElementSibling;
      if (tableTag == null) continue;

      // Split up the table into rows and remove the formatting.
      list.add(SchemaClassTemplate(
        fieldsType: nextTag.text.toFieldsType(),
        classNameTag: classNameTag,
        classCommentTags: classCommentTags,
        tableRows: tableTag.text.split('\n')..removeRange(0, 2),
      ));
    }

    return list;
  }

  FieldsType toFieldsType() {
    if (this == 'Fixed Fields') return FieldsType.fixed;
    if (this == 'Patterned Fields') return FieldsType.patterned;
    return FieldsType.unknown;
  }
}
