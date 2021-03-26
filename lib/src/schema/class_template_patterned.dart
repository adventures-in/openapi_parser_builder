import 'package:html/dom.dart';
import 'package:openapi_client_builder/src/schema/class_template.dart';

class ClassTemplatePatterned extends ClassTemplate {
  ClassTemplatePatterned(
      {required Element classNameTag,
      required List<Element> classCommentTags,
      required Element tableTag})
      : super(
            classNameTag: classNameTag,
            classCommentTags: classCommentTags,
            tableTag: tableTag);
}
