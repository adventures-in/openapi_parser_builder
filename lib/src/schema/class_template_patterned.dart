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
            tableTag: tableTag) {
    _patternedMemberString =
        firstMemberName.replaceAll(RegExp(r'{|}'), '') + 'Map';
  }

  late final String _patternedMemberString;

  @override
  String get output => '''

/// $classComment
class $className {
  $className();

  Map<String, PathItem> $_patternedMemberString = {};

  $className.fromJson(Map<String, dynamic> json) : 
    $_patternedMemberString = {}..addEntries(json.entries.map(
      (entry) => MapEntry(entry.key, PathItem.fromJson(entry.value))));
}

''';
}
