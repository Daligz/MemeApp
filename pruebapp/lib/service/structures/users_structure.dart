import 'package:http/http.dart';
import 'package:pruebapp/service/commons/device.dart';

import '../service_routes.dart';

class UserStructure {

  Future<bool> insert() async {
    final String macAddress = await Device.getMacAddress();
    if (macAddress.isEmpty) return false;
    final Response response = await get(Uri.parse(Routes.routeUserInsert(macAddress)));
    return (response.statusCode == 200);
  }
}