extension LegendMapUtil<K, V> on Map<K, V> {
  V get(
    dynamic key, {
    V? doesntExist,
  }) {
    final result = this[key];
    if (result == null) {
      if (doesntExist == null) {
        return values.first;
      }
      return doesntExist;
    }

    return this[key]!;
  }
}
