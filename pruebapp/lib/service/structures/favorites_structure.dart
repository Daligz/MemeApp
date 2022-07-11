
import 'package:http/http.dart' as http;
import 'package:pruebapp/service/utils/device.dart';

import '../service_routes.dart';

class FavoriteStructure {

  Future<bool> insert(final String postId) async {
    final String macAddress = await Device.getMacAddress();
    if (!(await exists(postId))) return false;
    return commonRequest(Routes.routeFavoriteInsert(macAddress, postId));
  }

  Future<bool> exists(final String postId) async {
    final String macAddress = await Device.getMacAddress();
    return commonRequest(Routes.routeFavoriteExists(macAddress, postId));
  }

  Future<bool> delete(final String postId) async {
    final String macAddress = await Device.getMacAddress();
    return commonRequest(Routes.routeFavoriteDelete(macAddress, postId));
  }

  Future<bool> commonRequest(final String route) async {
    final http.Response response = await http.get(Uri.parse(route));
    return (response.body.toLowerCase() == "true");
  }
}