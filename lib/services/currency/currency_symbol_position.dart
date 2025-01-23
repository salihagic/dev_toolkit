enum CurrencySymbolPosition {
  prefix,
  sufix;

  bool get isBefore => this == CurrencySymbolPosition.prefix;
  bool get isAfter => this == CurrencySymbolPosition.sufix;
}
