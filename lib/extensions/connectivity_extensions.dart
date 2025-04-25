import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

extension AppConnectivityExtensions on Connectivity {
  Future<bool> get isOnline async => (await checkConnectivity()).any(
        (x) => [
          ConnectivityResult.wifi,
          ConnectivityResult.ethernet,
          ConnectivityResult.mobile,
        ].contains(x),
      );
}
