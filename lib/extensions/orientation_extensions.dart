// Flutter imports:
import 'package:flutter/widgets.dart';

extension DevOrientationX on Orientation {
  bool get isPortait => this == Orientation.portrait;
  bool get isLandscape => this == Orientation.landscape;
}
