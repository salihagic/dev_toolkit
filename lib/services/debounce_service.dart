import 'package:easy_debounce/easy_debounce.dart';

abstract class DebounceService {
  void debounce(
    void Function() onExecute, {
    Duration duration,
    String tag,
  });
}

class DebounceServiceImpl implements DebounceService {
  @override
  void debounce(
    void Function() onExecute, {
    Duration duration = const Duration(milliseconds: 1500),
    String tag = 'common-debouncer',
  }) {
    EasyDebounce.debounce(
      tag,
      duration,
      onExecute,
    );
  }
}
