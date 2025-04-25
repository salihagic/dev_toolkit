import 'package:easy_debounce/easy_throttle.dart';

abstract class Throttler {
  static const defaultDuration = Duration(milliseconds: 1500);

  void throttle(
    void Function() onExecute, {
    Duration duration = defaultDuration,
    required String tag,
  });
}

class ThrottlerImpl implements Throttler {
  @override
  void throttle(
    void Function() onExecute, {
    Duration duration = Throttler.defaultDuration,
    required String tag,
  }) {
    EasyThrottle.throttle(
      tag,
      duration,
      onExecute,
    );
  }
}
