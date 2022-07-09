import 'package:http/http.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:pruebapp/service/service_routes.dart';

class Service {

  Future<bool> registerDevice() async {
    final String macAddress = await getMac();
    if (macAddress.isEmpty) return false;
    if (await deviceExist()) {
      print("Ya existe el dispositivo $macAddress!");
      return false;
    }
    print(macAddress);
    print(Routes.routeUserInsert(macAddress));
    final Response response = await get(Uri.parse(Routes.routeUserInsert(macAddress)));
    return (response.statusCode == 200);
  }

  Future<String> getPost() async {
    final Response response = await get(Uri.parse(Routes.routePostGet("animals", 1)));
    return response.body;
  }

  Future<bool> deviceExist() async {
    final String macAddress = await getMac();
    final Response response = await get(Uri.parse(Routes.routeUserExists(macAddress)));
    return (response.body.toLowerCase() == "true");
  }

  Future<String> getMac() async {
    String? macAddress;
    try {
      macAddress = await PlatformDeviceId.getDeviceId;
    } on PlatformDeviceId {
      return "";
    }
    if (macAddress == null || macAddress.isEmpty) return "";
    return macAddress;
  }
}