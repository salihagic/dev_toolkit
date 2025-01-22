import 'package:dev_toolkit/dev_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class DevToolkit {
  static Locale locale = Locale('en');

  static String get localeName => _getLocaleName();

  static DevToolkitDateTimePrettyFormatLocalizations get translations => _getDevToolkitDateTimePrettyFormatLocalizations();

  static String _getLocaleName() => intl.Intl.canonicalizedLocale(locale.toString());

  static DevToolkitDateTimePrettyFormatLocalizations _getDevToolkitDateTimePrettyFormatLocalizations() => switch (localeName) {
        'en' => DevToolkitDateTimePrettyFormatLocalizationsEn(),
        _ => DevToolkitDateTimePrettyFormatLocalizationsEn(),
      };
}
