import 'package:flutter/foundation.dart';

import 'package:haptic_feedback/haptic_feedback.dart';

abstract class VibrationService {
  Future<void> success();
  Future<void> warning();
  Future<void> error();
  Future<void> light();
  Future<void> medium();
  Future<void> heavy();
  Future<void> rigid();
  Future<void> soft();
  Future<void> selection();
}

class VibrationServiceImpl implements VibrationService {
  @override
  Future<void> success() async => await Haptics.vibrate(HapticsType.success);

  @override
  Future<void> warning() async => await Haptics.vibrate(HapticsType.warning);

  @override
  Future<void> error() async => await Haptics.vibrate(HapticsType.error);

  @override
  Future<void> light() async => await Haptics.vibrate(HapticsType.light);

  @override
  Future<void> medium() async => await Haptics.vibrate(HapticsType.medium);

  @override
  Future<void> heavy() async => await Haptics.vibrate(HapticsType.heavy);

  @override
  Future<void> rigid() async => await Haptics.vibrate(HapticsType.rigid);

  @override
  Future<void> soft() async => await Haptics.vibrate(HapticsType.soft);

  @override
  Future<void> selection() async =>
      await Haptics.vibrate(HapticsType.selection);
}

class MockVibrationServiceImpl implements VibrationService {
  @override
  Future<void> success() async => debugPrint('MOCK VIBRATION SERVICE: success');

  @override
  Future<void> warning() async => debugPrint('MOCK VIBRATION SERVICE: warning');

  @override
  Future<void> error() async => debugPrint('MOCK VIBRATION SERVICE: error');

  @override
  Future<void> light() async => debugPrint('MOCK VIBRATION SERVICE: light');

  @override
  Future<void> medium() async => debugPrint('MOCK VIBRATION SERVICE: medium');

  @override
  Future<void> heavy() async => debugPrint('MOCK VIBRATION SERVICE: heavy');

  @override
  Future<void> rigid() async => debugPrint('MOCK VIBRATION SERVICE: rigid');

  @override
  Future<void> soft() async => debugPrint('MOCK VIBRATION SERVICE: soft');

  @override
  Future<void> selection() async =>
      debugPrint('MOCK VIBRATION SERVICE: selection');
}
