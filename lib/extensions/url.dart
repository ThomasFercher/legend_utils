extension UrlExtensions on String {
  int depth() => allMatches("/").length;
}
