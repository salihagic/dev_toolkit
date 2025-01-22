import 'package:flutter/widgets.dart';

extension ScrollControllerX on ScrollController {
  void easeOut([int seconds = 1]) => animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeOut);
}
