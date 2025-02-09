extension DevIntNullableX on int? {
  int get value => this ?? 0;

  int? get orNull => this == 0 ? null : this;

  String spValue(String titleIfLessThan1, String titleIfGreaterThan1) =>
      value <= 1 ? titleIfLessThan1 : titleIfGreaterThan1;

  bool between(
    int min,
    int max, {
    bool startInclusive = true,
    bool endInclusive = true,
  }) {
    if (this == null) return false;

    if (startInclusive && endInclusive) return this! >= min && this! <= max;
    if (!startInclusive && endInclusive) return this! > min && this! <= max;
    if (startInclusive && !endInclusive) return this! >= min && this! < max;
    if (!startInclusive && !endInclusive) return this! > min && this! < max;

    return false;
  }

  String toStringWithByteSuffix() {
    if (this == null) return '0 B';

    if (value < 1024) return '$value B';
    if (value < 1024 * 1024) return '${(value / 1024).toStringAsFixed(1)} kB';
    if (value < 1024 * 1024 * 1024)
      return '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';

    return '${(value / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
