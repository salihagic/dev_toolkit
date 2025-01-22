import 'dart:math';

import 'package:dev_toolkit/dev_toolkit.dart';
import 'package:intl/intl.dart';

extension DoubleX on double? {
  String format([int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) {
    final formatter = NumberFormat.decimalPattern(DevToolkit.localeName);
    formatter.maximumFractionDigits = numberOfDecimals;
    formatter.minimumFractionDigits = numberOfDecimals;

    final result = formatter.format(value);

    return (ignoreDecimalIfZero && value - value.toInt() == 0) ? result.substring(0, result.length - numberOfDecimals - 1) : result;
  }

  String formatWithSign([int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) {
    final price = formatWithoutSign(numberOfDecimals, ignoreDecimalIfZero);
    final sign = value < 0
        ? '-'
        : (value > 0)
            ? '+'
            : '';

    return '$sign$price';
  }

  String formatWithPercentage([int numberOfDecimals = 2]) => '${format(numberOfDecimals)}%';
  String formatWithSignAndPercentage([int numberOfDecimals = 2]) => '${formatWithSign(numberOfDecimals)}%';
  String formatWithoutSign([int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) => format(numberOfDecimals, ignoreDecimalIfZero).replaceAll('-', '');
  // String formatWithCurrency([Currency? curr, int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) {
  //   final currency = curr ?? currencyService.getCurrencyByCodeOrDefault();

  //   return '${currency.symbolPosition.isBefore ? '${currency.symbol}' : ''}${format(numberOfDecimals, ignoreDecimalIfZero)}${currency.symbolPosition.isAfter ? ' ${currency.symbol}' : ''}';
  // }

  String formatWithCurrencyCode([String currencyCode = 'EUR']) => '$currencyCode ${format()}';

  double get value => this ?? 0.0;

  // Color priceAccentColor(AppThemeData appTheme) {
  //   if (value >= 0) {
  //     return appTheme.success;
  //   }

  //   if (value < 0) {
  //     return appTheme.danger;
  //   }

  //   return appTheme.primaryTextStyle.color;
  // }

  // Color valueHighlightColor(AppThemeData appTheme) => value >= 0 ? appTheme.success : appTheme.danger;

  String spValue(String titleIfLessThan1, String titleIfGreaterThan1) => value <= 1 ? titleIfLessThan1 : titleIfGreaterThan1;
}

extension DoubleListExtensions on List<double>? {
  int get maxNumberOfDigits {
    return this?.reduce(max).format(2, false).replaceAll('.', '').replaceAll(',', '').count ?? 0;
  }
}
