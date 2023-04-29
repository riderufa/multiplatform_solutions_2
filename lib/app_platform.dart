import 'dart:io';

import 'package:flutter/foundation.dart';

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'android': CustomPlatform.android,
    'fuchsia': CustomPlatform.fuchsia,
    'web': CustomPlatform.web,
    'undefined': CustomPlatform.undefined,
  };

  static CustomPlatform _getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    }
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static bool get isMobile =>
      platform == CustomPlatform.ios || platform == CustomPlatform.android;

  static CustomPlatform get platform => _getPlatform();
}

enum CustomPlatform {
  linux,
  macos,
  windows,
  ios,
  android,
  fuchsia,
  web,
  undefined,
}
