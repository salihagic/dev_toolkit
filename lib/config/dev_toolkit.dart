// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart' as intl;

// Project imports:
import 'package:dev_toolkit/dev_toolkit.dart';

class DevToolkit {
  static String currencyCode = 'USD';
  static String deviceInfoSignaturePrefix = '';
  static Locale locale = Locale('en');

  static String get localeName => _getLocaleName();

  static DevToolkitDateTimePrettyFormatLocalizations get translations =>
      _getDevToolkitDateTimePrettyFormatLocalizations();

  static String _getLocaleName() =>
      intl.Intl.canonicalizedLocale(locale.toString());

  static DevToolkitDateTimePrettyFormatLocalizations
      _getDevToolkitDateTimePrettyFormatLocalizations() => switch (localeName) {
            'en' => DevToolkitDateTimePrettyFormatLocalizationsEn(),
            // Add more languages
            _ => DevToolkitDateTimePrettyFormatLocalizationsEn(),
          };
}
