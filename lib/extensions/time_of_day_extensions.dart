import 'package:flutter/material.dart';

extension TimeOfDayX on TimeOfDay {
  bool isBetween(TimeOfDay left, TimeOfDay right) {
    return (left.hour < hour || (left.hour == hour && left.minute <= minute)) && (right.hour > hour || (right.hour == hour && right.minute >= minute));
  }

  bool isAfter(TimeOfDay right) {
    return right.hour < hour || (right.hour == hour && right.minute < minute);
  }

  double toDoubleHours() => hour + minute / 60.0;

  double toDoubleMinutes() => hour * 60.0 + minute;

  TimeOfDay difference(TimeOfDay right) {
    final differenceInMinutes = (toDoubleMinutes() - right.toDoubleMinutes()).abs();

    return TimeOfDay(
      hour: (differenceInMinutes / 60.0).floor(),
      minute: (differenceInMinutes % 60).floor(),
    );
  }

  String toFormattedString() => '${hour < 10 ? 0 : ''}$hour:${minute < 10 ? 0 : ''}$minute';

  String toJson() => toFormattedString();
}
