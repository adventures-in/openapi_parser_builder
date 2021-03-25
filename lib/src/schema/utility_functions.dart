import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/enums/fields_type.dart';
import 'package:openapi_client_builder/src/schema/class_template.dart';
import 'package:openapi_client_builder/src/extensions/string_extensions.dart';
import 'package:openapi_client_builder/src/schema/class_template_patterned.dart';

List<ClassTemplate> extractClassTemplates(Document document) {
  final list = <ClassTemplate>[];

  // Extract the relevant tags - every schema starts with a h4 tag
  final tags = document.querySelectorAll('h4');
  tags.removeAt(0); // the first item is the Version

  for (final classNameTag in tags) {
    // Move to the next sibling till we get a h5 tag
    var classCommentTags = <Element>[];
    var nextTag = classNameTag.nextElementSibling;
    while (nextTag != null &&
        nextTag.text != 'Fixed Fields' &&
        nextTag.text != 'Patterned Fields') {
      // nextTag.localName != 'h5'
      classCommentTags.add(nextTag);
      nextTag = nextTag.nextElementSibling;
    }

    // If we don't have the right subheading, this is not a schema item.
    if (nextTag == null) continue;

    final tableTag = nextTag.nextElementSibling;
    if (tableTag == null || tableTag.text.split('\n').length < 3) continue;

    // Split up the table into rows and remove the formatting.
    list.add((nextTag.text.toFieldsType() == FieldsType.fixed
        ? ClassTemplate(
            classNameTag: classNameTag,
            classCommentTags: classCommentTags,
            tableTag: tableTag,
          )
        : ClassTemplatePatterned(
            classNameTag: classNameTag,
            classCommentTags: classCommentTags,
            tableTag: tableTag,
          )));
  }

  return list;
}
