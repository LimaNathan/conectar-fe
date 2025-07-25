import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
import 'package:flutter/widgets.dart';

class ResponsivityUtil {
  DeviceScreenType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return switch (width) {
      >= 1024 => DeviceScreenType.desktop,
      >= 768 => DeviceScreenType.tablet,
      _ => DeviceScreenType.mobile,
    };
  }
}
