import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/enums/fields_type.dart';
import 'package:openapi_client_builder/src/schema/class_template.dart';
import 'package:openapi_client_builder/src/extensions/string_extensions.dart';
import 'package:openapi_client_builder/src/schema/class_template_patterned.dart';
import 'package:openapi_client_builder/src/extensions/element_extensions.dart';

List<ClassTemplate> extractClassTemplates(Document document) {
  final list = <ClassTemplate>[];

  // Extract the relevant tags - every schema starts with a h4 tag
  final tags = document.querySelectorAll('h4');
  tags.removeAt(0); // the first item is the Version

  for (final classNameTag in tags) {
    // Move to the next sibling till we get a h5 tag
    var classCommentTags = <Element>[];
    var nextTag = classNameTag.nextElementSibling;
    while (nextTag != null && nextTag.isNotTableHeader) {
      // Keep adding to the commentTags and moving on.
      classCommentTags.add(nextTag);
      nextTag = nextTag.nextElementSibling;
    }

    // Get the rest of the info.
    final isFixedFields = nextTag?.text.toFieldsType() == FieldsType.fixed;
    final tableTag = nextTag?.nextElementSibling;

    // If we don't have a table, this is not a schema item.
    if (tableTag == null || tableTag.text.split('\n').length < 3) continue;

    // Split up the table into rows and remove the formatting.
    list.add((isFixedFields
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
