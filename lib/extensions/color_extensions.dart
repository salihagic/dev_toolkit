import 'dart:ui';

extension DevColorX on Color? {
  String toHex({bool leadingHashSign = true, bool leadingOpacity = true}) => this != null
      ? '${leadingHashSign ? '#' : ''}'
          '${leadingOpacity ? (this!.a * 255).round().toRadixString(16).padLeft(2, '0') : ''}'
          '${(this!.r * 255).round().toRadixString(16).padLeft(2, '0')}'
          '${(this!.g * 255).round().toRadixString(16).padLeft(2, '0')}'
          '${(this!.b * 255).round().toRadixString(16).padLeft(2, '0')}'
      : '';
}
