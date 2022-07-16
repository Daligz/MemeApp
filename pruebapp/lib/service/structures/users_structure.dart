import 'package:http/http.dart';
import 'package:pruebapp/service/utils/device.dart';

import '../service_routes.dart';

class UserStructure {

  Future<bool> insert() async {
    final String macAddress = await Device.getMacAddress();
    if (macAddress.isEmpty) return false;
    if (await exists(macAddress)) return false;
    final Response response = await get(Uri.parse(Routes.routeUserInsert(macAddress)));
    return (response.statusCode == 200);
  }

  Future<bool> exists(final String macAddress) async {
    final Response response = await get(Uri.parse(Routes.routeUserExists(macAddress)));
    return (response.body.toLowerCase() == "true");
  }
}