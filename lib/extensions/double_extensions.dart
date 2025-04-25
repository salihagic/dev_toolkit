import 'dart:math';

import 'package:intl/intl.dart';

import 'package:dev_toolkit/dev_toolkit.dart';

extension DevDoubleX on double? {
  String format([int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) {
    final formatter = NumberFormat.decimalPattern(DevToolkit.localeName);
    formatter.maximumFractionDigits = numberOfDecimals;
    formatter.minimumFractionDigits = numberOfDecimals;

    final result = formatter.format(value);

    return (ignoreDecimalIfZero && (value % 1 == 0))
        ? result.substring(0, result.length - numberOfDecimals - 1)
        : result;
  }

  String formatWithSign(
      [int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) {
    final price = formatWithoutSign(numberOfDecimals, ignoreDecimalIfZero);
    final sign = value < 0
        ? '-'
        : (value > 0)
            ? '+'
            : '';

    return '$sign$price';
  }

  String formatWithPercentage([int numberOfDecimals = 2]) =>
      '${format(numberOfDecimals)}%';
  String formatWithSignAndPercentage([int numberOfDecimals = 2]) =>
      '${formatWithSign(numberOfDecimals)}%';
  String formatWithoutSign(
          [int numberOfDecimals = 2, bool ignoreDecimalIfZero = true]) =>
      format(numberOfDecimals, ignoreDecimalIfZero).replaceAll('-', '');

  double get value => this ?? 0.0;

  String spValue(String titleIfLessThan1, String titleIfGreaterThan1) =>
      value <= 1 ? titleIfLessThan1 : titleIfGreaterThan1;
}

extension DoubleListExtensions on List<double>? {
  int get maxNumberOfDigits =>
      this
          ?.map(
              (e) => e.format(2, false).replaceAll(RegExp(r'[.,]'), '').length)
          .reduce(max) ??
      0;
}
