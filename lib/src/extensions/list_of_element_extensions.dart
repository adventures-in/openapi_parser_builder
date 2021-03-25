import 'package:html/dom.dart';

extension ListOfElement on List<Element> {
  String toCommentsString() =>
      map<String>((tag) => tag.text.replaceAll('\n', '\n/// ')).join('\n/// ');
}
