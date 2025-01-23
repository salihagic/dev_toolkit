import 'package:dev_toolkit/dev_toolkit.dart';

class Currency {
  final String symbol;
  final String code;
  final CurrencySymbolPosition symbolPosition;

  Currency({
    required this.symbol,
    required this.code,
    required this.symbolPosition,
  });
}
