import 'package:platform_device_id/platform_device_id.dart';

class Device {

  static Future<String> getMacAddress() async {
    String? macAddress;
    try {
      macAddress = await PlatformDeviceId.getDeviceId;
    } on PlatformDeviceId {
      return "";
    }
    if (macAddress == null || macAddress.isEmpty) return "";
    if (macAddress.contains("Windows")) return "debug";
    return macAddress;
  }
}