import 'package:html/dom.dart';

class BuilderClassTemplate {
  BuilderClassTemplate({required Element tag}) : _tag = tag {
    _className = _tag.text.split(' ').first;
    _classComment = _tag.nextElementSibling?.text.replaceAll(r'\n', '\\\\n');
  }

  final Element _tag;
  late final String _className;
  late final String? _classComment;

  String get output => '''
    /// $_classComment
    class $_className {
      $_className();
    }
    

  ''';
}
