import 'int_extensions.dart';

extension DevDurationX on Duration? {
  bool between(Duration start, Duration end, [bool endInclusive = true]) {
    if (this == null) return false;

    if (endInclusive) {
      return this! >= start && this! <= end;
    } else {
      return this! >= start && this! < end;
    }
  }

  String format({
    bool hours = true,
    bool minutes = true,
    bool seconds = true,
    bool shrink = false,
    bool shrinkHours = true,
    bool shrinkMinutes = true,
    bool shrinkSeconds = true,
  }) {
    final hh = (this?.inHours ?? 0).toString().padLeft(2, '0');
    final mm =
        ((this?.inMinutes ?? 0).remainder(60)).toString().padLeft(2, '0');
    final ss =
        ((this?.inSeconds ?? 0).remainder(60)).toString().padLeft(2, '0');

    var result = '';

    final showHours = shrink && shrinkHours ? hours && hh != '00' : hours;
    final showMinutes =
        shrink && shrinkMinutes ? minutes && mm != '00' : minutes;
    final showSeconds =
        shrink && shrinkSeconds ? seconds || ss != '00' : seconds;

    if (showHours) result += hh;
    if (showHours && showMinutes) result += ':';
    if (showMinutes) result += mm;
    if ((showHours || showMinutes) && showSeconds) result += ':';
    if (showSeconds) result += ss;

    return result;
  }

  String prettyFormat() {
    final hh = (this?.inHours ?? 0).toString();
    final mm = ((this?.inMinutes ?? 0).remainder(60)).toString();
    final ss = ((this?.inSeconds ?? 0).remainder(60)).toString();

    if (hh != '0') return '$hh h $mm min $ss sec';
    if (mm != '0') return '$mm min $ss sec';
    if (ss != '0') return '$ss sec';

    return '';
  }

  /// Decreases the current duration value by a percentage of its value.
  /// Example:
  /// Current value: hours: 1, minutes: 30, seconds: 20, milliseconds: 500
  /// coefficient: 0.5
  /// Resulting value: hours: 0, minutes: 45, seconds: 10, milliseconds: 250
  Duration scaleByCoefficient([double coefficient = 1.0]) {
    // Ensure the coefficient is between 0.0 and 1.0
    assert(coefficient >= 0.0 && coefficient <= 1.0,
        'Coefficient must be between 0.0 and 1.0');

    // Calculate the total duration in milliseconds
    final totalMilliseconds = this?.inMilliseconds ?? 0;

    // Calculate the new duration by multiplying with the coefficient
    final newMilliseconds = (totalMilliseconds * coefficient).toInt();

    // Return the new duration
    return Duration(milliseconds: newMilliseconds);
  }

  /// Decreases the current duration value by a duration parameter.
  /// Example:
  /// Current value: hours: 1, minutes: 30, seconds: 20, milliseconds: 500
  /// duration: hours: 0, minutes: 10, seconds: 10, milliseconds: 100
  /// Resulting value: hours: 1, minutes: 20, seconds: 10, milliseconds: 400
  Duration scale(Duration duration) {
    // Subtract the provided duration from the current duration
    return Duration(
      microseconds: (this?.inMicroseconds ?? 0) - duration.inMicroseconds,
    );
  }

  /// Increases the current duration value by a duration parameter.
  Duration increaseBy(Duration duration) {
    // Subtract the provided duration from the current duration
    return Duration(
      microseconds: (this?.inMicroseconds ?? 0) + duration.inMicroseconds,
    );
  }

  Duration get positiveOrZero =>
      (this?.isNegative ?? false) ? const Duration() : this!;

  double operator /(Duration other) => other.inMicroseconds == 0
      ? 0
      : (this?.inMicroseconds ?? 0) / other.inMicroseconds;

  String toFormattedString() {
    final hours = (this?.inHours).value.toString().padLeft(2, '0');
    final minutes =
        (this?.inMinutes).value.remainder(60).toString().padLeft(2, '0');
    final seconds =
        (this?.inSeconds).value.remainder(60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  String toJson() => toFormattedString();
}
