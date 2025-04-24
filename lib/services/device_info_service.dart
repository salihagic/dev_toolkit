// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';

// Project imports:
import 'package:dev_toolkit/dev_toolkit.dart';

enum DevicePlatform {
  android,
  ios,
  other,
}

class DeviceInfoServiceFactory {
  static DeviceInfoService resolveByPlatform() {
    if (Platform.isAndroid) {
      return AndroidDeviceInfoServiceImpl();
    } else if (Platform.isIOS) {
      return IOSDeviceInfoServiceImpl();
    } else {
      return MockDeviceInfoServiceImpl();
    }
  }
}

abstract class DeviceInfoService {
  DevicePlatform get platform;
  Future<void> init();
  void log([bool verbose = false]);
  Map<String, dynamic> info();
  String signature([String? prefix]);
}

class AndroidDeviceInfoServiceImpl implements DeviceInfoService {
  final _deviceInfo = DeviceInfoPlugin();
  late AndroidDeviceInfo _androidInfo;
  late String _consistentUdid;

  @override
  DevicePlatform get platform => DevicePlatform.android;

  @override
  Future<void> init() async {
    _androidInfo = await _deviceInfo.androidInfo;
    _consistentUdid = await FlutterUdid.consistentUdid;

    log();
  }

  @override
  void log([bool verbose = false]) => debugPrint(info().toString());

  @override
  Map<String, dynamic> info() {
    return {
      'platform': platform.name,
      'id': _androidInfo.id,
      'brand': _androidInfo.brand,
      'device': _androidInfo.device,
      'manufacturer': _androidInfo.manufacturer,
      'model': _androidInfo.model,
      'product': _androidInfo.product,
      'isPhysicalDevice': _androidInfo.isPhysicalDevice,
      'version': {
        'baseOS': _androidInfo.version.baseOS,
        'codename': _androidInfo.version.codename,
        'incremental': _androidInfo.version.incremental,
        'previewSdkInt': _androidInfo.version.previewSdkInt,
        'release': _androidInfo.version.release,
        'sdkInt': _androidInfo.version.sdkInt,
        'securityPatch': _androidInfo.version.securityPatch,
      },
      'fingerprint': _androidInfo.fingerprint,
      'board': _androidInfo.board,
      'bootloader': _androidInfo.bootloader,
      'display': _androidInfo.display,
      'hardware': _androidInfo.hardware,
      'host': _androidInfo.host,
      'supported32BitAbis': _androidInfo.supported32BitAbis,
      'supported64BitAbis': _androidInfo.supported64BitAbis,
      'supportedAbis': _androidInfo.supportedAbis,
      'tags': _androidInfo.tags,
      'type': _androidInfo.type,
      'serialNumber': _androidInfo.serialNumber,
      'data': _androidInfo.data,
      'systemFeatures': _androidInfo.systemFeatures,
    };
  }

  @override
  String signature([String? prefix]) =>
      '${prefix.value}${DevToolkit.deviceInfoSignaturePrefix}[ANDROID]-$_consistentUdid';
}

class IOSDeviceInfoServiceImpl implements DeviceInfoService {
  final _deviceInfo = DeviceInfoPlugin();
  late IosDeviceInfo _iosInfo;
  late String _consistentUdid;

  @override
  DevicePlatform get platform => DevicePlatform.ios;

  @override
  Future<void> init() async {
    _consistentUdid = await FlutterUdid.consistentUdid;
    _iosInfo = await _deviceInfo.iosInfo;
  }

  @override
  void log([bool verbose = false]) => debugPrint(info().toString());

  @override
  Map<String, dynamic> info() {
    return {
      'name': _iosInfo.name,
      'systemName': _iosInfo.systemName,
      'systemVersion': _iosInfo.systemVersion,
      'model': _iosInfo.model,
      'localizedModel': _iosInfo.localizedModel,
      'identifierForVendor': _iosInfo.identifierForVendor,
      'isPhysicalDevice': _iosInfo.isPhysicalDevice,
      'utsname': {
        'machine': _iosInfo.utsname.machine,
        'nodename': _iosInfo.utsname.nodename,
        'release': _iosInfo.utsname.release,
        'sysname': _iosInfo.utsname.sysname,
        'version': _iosInfo.utsname.version,
      },
      'data': _iosInfo.data,
    };
  }

  @override
  String signature([String? prefix]) =>
      '${prefix.value}${DevToolkit.deviceInfoSignaturePrefix}[iOS]-$_consistentUdid';
}

class MockDeviceInfoServiceImpl implements DeviceInfoService {
  @override
  Future<void> init() async {}

  @override
  DevicePlatform get platform => DevicePlatform.other;

  @override
  void log([bool verbose = false]) => debugPrint(info().toString());

  @override
  Map<String, dynamic> info() => {'DATA': 'This device is mocked'};

  @override
  String signature([String? prefix]) => 'SIGNATURE';
}
