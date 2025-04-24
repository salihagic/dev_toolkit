// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

extension DevGoRouterX on GoRouter {
  BuildContext? get context => routerDelegate.navigatorKey.currentContext;

  Future<T?> popToBottomAndPushReplacement<T>(String location,
      {Object? extra}) async {
    while (canPop()) {
      pop();
    }

    return await pushReplacement(location, extra: extra);
  }

  void popToBottom() {
    while (canPop()) {
      pop();
    }
  }
}
