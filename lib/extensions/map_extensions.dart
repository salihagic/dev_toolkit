import 'package:dev_toolkit/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';

extension MapStringDynamicX on Map<String, dynamic>? {
  /// For parsing objects of some class type that has it's own parse (eg. fromJson method)
  T? parse<T>(String key, T? Function(Map<String, dynamic> map) parser) {
    try {
      return this == null
          ? null
          : this![key] != null
              ? parser.call(this![key])
              : null;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  T? parseValue<T>(String key, [T? Function(dynamic map)? parser]) {
    try {
      return (this == null || this?[key] == null)
          ? null
          : (parser?.call(this![key]) ?? this![key]);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  T? parseEnum<T, PT>(String key, [T? Function(PT index)? parser]) {
    try {
      return (this == null || this?[key] == null)
          ? null
          : (parser?.call(this![key]) ?? this![key]);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  dynamic parseDouble(String key, [dynamic Function(dynamic map)? parser]) {
    try {
      final value = parseValue(key, parser);

      return value is int? ? value?.toDouble() : value;
    } catch (e) {
      return null;
    }
  }

  DateTime? parseDate(String key) {
    try {
      final value = parseValue(key, (x) => DateTime.parse(x));

      return value == null
          ? null
          : (value.isUtc ? value : DateTime.parse('${value.toString()}Z'))
              .toLocal();
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  TimeOfDay? parseTime(String key) {
    try {
      return parseValue(key, (x) {
        if (x.endsWith('Z')) {
          final dateTime = DateTime.parse('2021-11-01 $x').toLocal();

          return dateTime.timeOfDay;
        }

        return parseTimeOfDay(x);
      });
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Duration? parseDuration(String key) {
    try {
      return parseValue(key, (x) => parseDurationValue(x));
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  /// Parses a full [Duration] value from a string.
  ///
  /// The string must be in the format of `HH:MM:SS.uS`.
  ///
  /// The micro seconds are padded with zeros to 6 digits for easier use.
  Duration? parseFullDuration(String key) {
    try {
      return parseValue(key, (x) => parseFullDurationValue(x));
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  T? parseItem<T>(String key, [T? Function(Map<String, dynamic> map)? parser]) {
    try {
      return (this == null || this?[key] == null)
          ? null
          : (parser?.call(this![key]) ?? this![key]);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  List<T> parseList<T>(String key,
      [T Function(Map<String, dynamic> map)? parser]) {
    try {
      return this?[key]?.map<T>((x) => parser?.call(x) ?? x as T)?.toList() ??
          [];
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }
}

extension MapX on Map? {
  T? parse<T>(String key, T? Function(Map<String, dynamic> map) parser) {
    try {
      return this == null
          ? null
          : this![key] != null
              ? parser.call(this![key])
              : null;
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  T? parseValue<T>(String key, [T? Function(dynamic map)? parser]) {
    try {
      return (this == null || this?[key] == null)
          ? null
          : (parser?.call(this![key]) ?? this![key]);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  DateTime? parseDate(String key) {
    try {
      return parseValue(key, (x) => DateTime.parse(x).toLocal());
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  TimeOfDay? parseTime(String key) {
    try {
      return parseValue(key, (x) => parseTimeOfDay(x));
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  List<T> parseList<T>(String key,
      [T Function(Map<String, dynamic> map)? parser]) {
    try {
      return this?[key]?.map<T>((x) => parser?.call(x) ?? x as T)?.toList() ??
          [];
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }
}

List<T> parseList<T>(List<dynamic>? map,
    [T Function(Map<String, dynamic> map)? parser]) {
  return map?.map<T>((x) => parser?.call(x) ?? x as T).toList() ?? [];
}

TimeOfDay? parseTimeOfDay(String? value) => value != null
    ? TimeOfDay(
        hour: int.parse(value.split(':')[0]),
        minute: int.parse(value.split(':')[1]))
    : null;

Duration? parseDurationValue(String? value) => value != null
    ? Duration(
        hours: int.parse(value.split(':')[0]),
        minutes: int.parse(value.split(':')[1]),
        seconds: int.parse(value.split(':')[2]))
    : null;

/// Parses a full [Duration] value from a string.
///
/// The string must be in the format of `HH:MM:SS.uS`.
///
/// The micro seconds are padded with zeros to 6 digits for easier use.
Duration? parseFullDurationValue(String? value) {
  if (value == null) return null;

  final parts = value.split('.');

  final bigValues = parts.firstOrNull?.split(':');
  final microSeconds = parts.elementAtOrNull(1)?.padRight(6, '0');

  return Duration(
    hours: int.tryParse(bigValues?.elementAtOrNull(0) ?? '0') ?? 0,
    minutes: int.tryParse(bigValues?.elementAtOrNull(1) ?? '0') ?? 0,
    seconds: int.tryParse(bigValues?.elementAtOrNull(2) ?? '0') ?? 0,
    microseconds: int.tryParse(microSeconds ?? '0') ?? 0,
  );
}
