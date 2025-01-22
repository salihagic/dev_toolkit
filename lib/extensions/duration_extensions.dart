extension DurationX on Duration? {
  String format({bool hours = true, bool minutes = true, bool seconds = true, bool shrink = false}) {
    final hh = (this?.inHours ?? 0).toString().padLeft(2, '0');
    final mm = ((this?.inMinutes ?? 0) % 60).toString().padLeft(2, '0');
    final ss = ((this?.inSeconds ?? 0) % 60).toString().padLeft(2, '0');

    var result = '';

    final showHours = shrink ? hours && hh != '00' : hours;
    final showMinutes = shrink ? minutes && mm != '00' : minutes;
    final showSeconds = shrink ? seconds || ss != '00' : seconds;

    if (showHours) result += hh;
    if (showHours && showMinutes) result += ':';
    if (showMinutes) result += mm;
    if ((showHours || showMinutes) && showSeconds) result += ':';
    if (showSeconds) result += ss;

    return result;
  }

  Duration scale([double coefficient = 1.0]) {
    final totalSeconds = this?.inSeconds ?? 0;

    return Duration(seconds: (totalSeconds * coefficient).toInt());
  }

  Duration get positiveOrZero => (this?.isNegative ?? false) ? const Duration() : this!;

  double operator /(Duration other) => (this?.inMicroseconds ?? 0) / other.inMicroseconds;
}
