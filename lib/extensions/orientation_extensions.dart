import 'package:flutter/widgets.dart';

extension OrientationX on Orientation {
  bool get isPortait => this == Orientation.portrait;
  bool get isLandscape => this == Orientation.landscape;
}
