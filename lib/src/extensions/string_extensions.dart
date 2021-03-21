extension StringExtension on String {
  String toDartType() {
    final trimmedThis = trim();
    if (trimmedThis == 'string') return 'String';
    if (trimmedThis == 'boolean') return 'bool';
    if (trimmedThis == 'Any') return 'dynamic';

    if (trimmedThis.length > 4 && trimmedThis.substring(0, 4) == 'Map[') {
      final insideOfMap = trimmedThis.substring(4, trimmedThis.length - 1);
      final insideTypes = insideOfMap.split(', ');
      return 'Map<${insideTypes.first.toDartType()}, ${insideTypes.last.toDartType()}>';
    }

    if (trimmedThis[0] == '[' && trimmedThis[length - 1] == ']') {
      var s = trimmedThis.replaceAll('[', '');
      s = s.replaceAll(']', '');
      return 'List<${s.toDartType()}>';
    }

    final unionObjects = trimmedThis.split(r' \| ');
    if (unionObjects.length > 1) {
      var unionString = unionObjects.first.toDartType();
      for (var i = 1; i < unionObjects.length; i++) {
        unionString += ' | ' + unionObjects.elementAt(i).toDartType();
      }
      return unionString;
    }

    final objectWords = trimmedThis.split(' ');
    if (objectWords.last == 'Object') {
      return (trimmedThis.split(' ')..removeLast()).join();
    }
    return '/// __${this}__';
  }
}
