// Flutter imports:
import 'package:flutter/material.dart';

extension DevBuildContextX on BuildContext {
  void unfocus() => FocusManager.instance.primaryFocus?.unfocus();

  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  double get statusBarHeight => viewPadding.top;
  double get bottomNavigationBarHeight => viewPadding.bottom;
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  Orientation get orientation => MediaQuery.orientationOf(this);

  bool get isLandscape => (orientation == Orientation.landscape);
  bool get isPortrait => (orientation == Orientation.portrait);
}
