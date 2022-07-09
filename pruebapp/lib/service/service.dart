// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mac_address/mac_address.dart';
import 'package:pruebapp/service/service_routes.dart';

class Service {

  Future<http.Response> registerDevice() async {
    final String macAddress = "dfgdfgdfg";//await GetMac.macAddress;
    print(macAddress);
    print(Routes.routeUserInsert(macAddress));
    // final http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
    final http.Response response = await http.get(Uri.parse(Routes.routeUserInsert(macAddress)));
    return response;
    // final response = await Dio().get(Routes.routeUserInsert(macAddress));
    // return (response.statusCode == 200);
  }

  Future<String> getPost() async {
    // final response = await Dio().get(Routes.routePostGet("animals", 1));
    // return response.data;
    return "";
  }
}