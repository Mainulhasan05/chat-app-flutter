import 'package:flutter/material.dart';

class DeviceUtil {
  static String get _getDeviceType {
    final data = MediaQueryData.fromView(
        WidgetsBinding.instance!.platformDispatcher.views.first);
    return data.size.shortestSide < 550 ? 'phone' : 'tablet';
  }

  static bool get isTablet {
    return _getDeviceType == 'tablet';
  }
}
