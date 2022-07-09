import 'package:http/http.dart';
import 'package:pruebapp/service/service_routes.dart';

class Service {

  Future<bool> registerDevice() async {
    final Response response = await get(Uri.parse(Routes.routeUserInsert("test")));
    return (response.statusCode == 200);
  }
}