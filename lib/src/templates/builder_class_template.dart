import 'package:html/dom.dart';
import '../extensions/string_extensions.dart';

class BuilderClassTemplate {
  BuilderClassTemplate(
      {required Element classNameTag,
      required Element classCommentTag,
      required List<String> tableRows})
      : _classNameTag = classNameTag,
        _classCommentTag = classCommentTag {
    _className = (_classNameTag.text.split(' ')..removeLast()).join();
    _classComment = _classCommentTag.text.replaceAll('\n', '\n/// ');
    var classMembers = '';
    for (final row in tableRows) {
      final rowParts = row.split(' | ');
      var classMemberString = '';
      if (rowParts.length > 2) {
        classMemberString += '  /// ${rowParts.elementAt(2).trim()}\n';
      }
      classMembers += classMemberString +
          '  ${rowParts.elementAt(1).trim().toDartType()} ${rowParts.first.trim()};\n';
    }
    _classMembers = classMembers;
  }

  final Element _classNameTag;
  final Element _classCommentTag;
  late final String _className;
  late final String _classComment;
  late final String _classMembers;

  String get output => '''

/// $_classComment
class $_className {
  $_className();

$_classMembers
}

''';
}
