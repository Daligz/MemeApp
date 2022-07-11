
import 'package:http/http.dart' as http;
import 'package:pruebapp/service/utils/device.dart';

import '../service_routes.dart';

class FavoriteStructure {

  Future<bool> insert(final String postId) async {
    final String macAddress = await Device.getMacAddress();
    final http.Response response = await http.get(Uri.parse(Routes.routeFavoriteInsert(macAddress, postId)));
    return (response.body.toLowerCase() == "true");
  }
}