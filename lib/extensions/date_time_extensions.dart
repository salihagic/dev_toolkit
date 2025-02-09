import 'package:dev_toolkit/dev_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DevDateTimeX on DateTime? {
  String format([String pattern = 'dd.MM.yyyy']) =>
      this != null ? DateFormat(pattern).format(this!).toString() : '';

  String formattimehmma() => this != null
      ? DateFormat('HH:mm', DevToolkit.localeName).format(this!).toString()
      : '';

  String formatDateTime(
          {String pattern = 'dd.MM.yyyy', String? separator = ' '}) =>
      this != null ? '${format(pattern)}$separator${formattimehmma()}' : '';

  TimeOfDay? get timeOfDay => this == null
      ? null
      : TimeOfDay(hour: this?.hour ?? 0, minute: this?.minute ?? 0);
  TimeOfDay get timeOfDayOrNow {
    if (this == null) {
      final now = DateTime.now();

      return TimeOfDay(hour: now.hour, minute: now.minute);
    }

    return TimeOfDay(hour: this!.hour, minute: this!.minute);
  }

  DateTime? get date =>
      this == null ? null : DateTime(this!.year, this!.month, this!.day);
  DateTime get dateOrNow => this == null
      ? DateTime.now()
      : DateTime(this!.year, this!.month, this!.day);
  DateTime get valueOrNow => this ?? DateTime.now();

  bool get isToday {
    if (this == null) {
      return false;
    }

    final now = DateTime.now();

    return this!.year == now.year &&
        this!.month == now.month &&
        this!.day == now.day;
  }

  String? toJson() {
    return this != null
        ? '${_pad(this!.year)}-${_pad(this!.month)}-${_pad(this!.day)}T${_pad(this!.hour)}:${_pad(this!.minute)}:${_pad(this!.second)}'
        : null;
  }

  String? toJsonDate() {
    return this != null
        ? '${_pad(this!.year)}-${_pad(this!.month)}-${_pad(this!.day)}'
        : null;
  }

  DateTime? withTime(TimeOfDay? timeOfDay) {
    if (this == null || timeOfDay == null) {
      return this;
    }

    return this?.copyWith(
      hour: timeOfDay.hour,
      minute: timeOfDay.minute,
    );
  }

  String _pad(int value) => value.toString().padLeft(2, '0');

  String prettyFormat([String pattern = 'dd.MM.yyyy']) {
    if (this == null) {
      return '';
    }

    final p = period;

    return switch (p.period) {
      DateTimePeriod.lastWeek => format(pattern),
      DateTimePeriod.beforeFewDays => p.amount.spValue(
          DevToolkit.translations.pretty_format_before_1_day,
          DevToolkit.translations
              .pretty_format_before_few_days(p.amount.toString())),
      DateTimePeriod.yesterday =>
        DevToolkit.translations.pretty_format_yesterday_at(formattimehmma()),
      DateTimePeriod.beforeFewHours => p.amount.spValue(
          DevToolkit.translations.pretty_format_before_1_hour,
          DevToolkit.translations
              .pretty_format_before_few_hours(p.amount.toString())),
      DateTimePeriod.beforeFewMinutes => p.amount.spValue(
          DevToolkit.translations.pretty_format_before_1_minute,
          DevToolkit.translations
              .pretty_format_before_few_minutes(p.amount.toString())),
      DateTimePeriod.beforeFewSeconds => p.amount.spValue(
          DevToolkit.translations.pretty_format_before_1_second,
          DevToolkit.translations
              .pretty_format_before_few_seconds(p.amount.toString())),
      DateTimePeriod.now => DevToolkit.translations.just_now,
      DateTimePeriod.afterFewSeconds => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_second,
          DevToolkit.translations
              .pretty_format_in_few_seconds(p.amount.toString())),
      DateTimePeriod.afterFewMinutes => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_minute,
          DevToolkit.translations
              .pretty_format_in_few_minutes(p.amount.toString())),
      DateTimePeriod.afterFewHours => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_hour,
          DevToolkit.translations
              .pretty_format_in_few_hours(p.amount.toString())),
      DateTimePeriod.tomorrow =>
        DevToolkit.translations.pretty_format_tomorrow_at(formattimehmma()),
      DateTimePeriod.afterFewDays => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_day,
          DevToolkit.translations
              .pretty_format_in_few_days(p.amount.toString())),
      DateTimePeriod.nextWeek => format(pattern),
      DateTimePeriod.general => format(pattern),
    };
  }

  String prettyFormatShort([String pattern = 'dd.MM.yyyy']) {
    if (this == null) {
      return '';
    }

    final p = period;

    return switch (p.period) {
      DateTimePeriod.lastWeek => format(pattern),
      DateTimePeriod.beforeFewDays => p.amount.spValue(
          DevToolkit.translations.pretty_format_short_before_1_day,
          DevToolkit.translations
              .pretty_format_short_before_few_days(p.amount.toString())),
      DateTimePeriod.yesterday =>
        DevToolkit.translations.pretty_format_short_before_1_day,
      DateTimePeriod.beforeFewHours => p.amount.spValue(
          DevToolkit.translations.pretty_format_short_before_1_hour,
          DevToolkit.translations
              .pretty_format_short_before_few_hours(p.amount.toString())),
      DateTimePeriod.beforeFewMinutes => p.amount.spValue(
          DevToolkit.translations.pretty_format_short_before_1_minute,
          DevToolkit.translations
              .pretty_format_short_before_few_minutes(p.amount.toString())),
      DateTimePeriod.beforeFewSeconds => p.amount.spValue(
          DevToolkit.translations.pretty_format_short_before_1_second,
          DevToolkit.translations
              .pretty_format_short_before_few_seconds(p.amount.toString())),
      DateTimePeriod.now => DevToolkit.translations.just_now,
      DateTimePeriod.afterFewSeconds => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_second,
          DevToolkit.translations
              .pretty_format_in_few_seconds(p.amount.toString())),
      DateTimePeriod.afterFewMinutes => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_minute,
          DevToolkit.translations
              .pretty_format_in_few_minutes(p.amount.toString())),
      DateTimePeriod.afterFewHours => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_hour,
          DevToolkit.translations
              .pretty_format_in_few_hours(p.amount.toString())),
      DateTimePeriod.tomorrow =>
        DevToolkit.translations.pretty_format_tomorrow_at(formattimehmma()),
      DateTimePeriod.afterFewDays => p.amount.spValue(
          DevToolkit.translations.pretty_format_in_1_day,
          DevToolkit.translations
              .pretty_format_in_few_days(p.amount.toString())),
      DateTimePeriod.nextWeek => format(pattern),
      DateTimePeriod.general => format(pattern),
    };
  }

  DateTimePeriodModel get period {
    final currentDateTime = DateTime.now();
    final currentDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);

    final thisDateTime = this!;
    final thisDate =
        DateTime(thisDateTime.year, thisDateTime.month, thisDateTime.day);

    final differenceInDays = thisDate.difference(currentDate).inDays;
    final differenceInHours = thisDateTime.difference(currentDateTime).inHours;
    final differenceInMinutes =
        thisDateTime.difference(currentDateTime).inMinutes;
    final differenceInSeconds =
        thisDateTime.difference(currentDateTime).inSeconds;

    if (differenceInDays < -13)
      return DateTimePeriodModel(period: DateTimePeriod.general);
    if (differenceInDays < -6)
      return DateTimePeriodModel(period: DateTimePeriod.lastWeek);
    if (differenceInDays.between(-6, -2))
      return DateTimePeriodModel(
          period: DateTimePeriod.beforeFewDays, amount: differenceInDays.abs());
    if (differenceInDays == -1)
      return DateTimePeriodModel(period: DateTimePeriod.yesterday);

    if (differenceInDays == 0 && differenceInHours < 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.beforeFewHours,
          amount: differenceInHours.abs());

    if (differenceInDays == 0 &&
        differenceInHours == 0 &&
        differenceInMinutes < 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.beforeFewMinutes,
          amount: differenceInMinutes.abs());

    if (differenceInDays == 0 &&
        differenceInHours == 0 &&
        differenceInMinutes == 0 &&
        differenceInSeconds < 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.beforeFewSeconds,
          amount: differenceInSeconds.abs());
    if (differenceInDays == 0 &&
        differenceInHours == 0 &&
        differenceInMinutes == 0 &&
        differenceInSeconds == 0)
      return DateTimePeriodModel(period: DateTimePeriod.now);
    if (differenceInDays == 0 &&
        differenceInHours == 0 &&
        differenceInMinutes == 0 &&
        differenceInSeconds > 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.afterFewSeconds, amount: differenceInSeconds);

    if (differenceInDays == 0 &&
        differenceInHours == 0 &&
        differenceInMinutes > 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.afterFewMinutes, amount: differenceInMinutes);

    if (differenceInDays == 0 && differenceInHours > 0)
      return DateTimePeriodModel(
          period: DateTimePeriod.afterFewHours, amount: differenceInHours);

    if (differenceInDays == 1)
      return DateTimePeriodModel(period: DateTimePeriod.tomorrow);
    if (differenceInDays.between(2, 6))
      return DateTimePeriodModel(
          period: DateTimePeriod.afterFewDays, amount: differenceInDays);
    if (differenceInDays > 6)
      return DateTimePeriodModel(period: DateTimePeriod.nextWeek);
    if (differenceInDays > 13)
      return DateTimePeriodModel(period: DateTimePeriod.general);

    return DateTimePeriodModel(period: DateTimePeriod.general);
  }
}

enum DateTimePeriod {
  lastWeek,
  beforeFewDays,
  yesterday,
  beforeFewHours,
  beforeFewMinutes,
  beforeFewSeconds,
  now,
  afterFewSeconds,
  afterFewMinutes,
  afterFewHours,
  tomorrow,
  afterFewDays,
  nextWeek,
  general;
}

class DateTimePeriodModel {
  final DateTimePeriod period;
  final int amount;

  DateTimePeriodModel({
    required this.period,
    this.amount = 0,
  });
}

extension DateTimeListExtension on List<DateTime>? {
  /// Finds and returns minimum date and maximum date respectively, null is returned if list is empty or null
  (DateTime?, DateTime?) getMinAndMax() {
    // Handle null or empty list
    if (this.isNullOrEmpty) {
      return (null, null);
    }

    // Initialize min and max with the first element
    DateTime? minDate = this![0];
    DateTime? maxDate = this![0];

    // Iterate through the list to find min and max
    for (var date in this!) {
      if (date.isBefore(minDate!)) {
        minDate = date;
      }

      if (date.isAfter(maxDate!)) {
        maxDate = date;
      }
    }

    return (minDate, maxDate);
  }
}
