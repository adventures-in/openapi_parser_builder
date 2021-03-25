extension ListExtension on List {
  T elementAtOrNull<T>(int index) => index >= length ? null : elementAt(index);
  T firstOrNull<T>() => isEmpty ? null : first;
  T lastOrNull<T>() => isEmpty ? null : last;
}
