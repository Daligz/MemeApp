import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pruebapp/service/commons/post.dart';

import '../service_routes.dart';

class PostStructure {

  Future<List<Post>> get(final String category, final int amount) async {
    final http.Response response = await http.get(Uri.parse(Routes.routePostGet(category, amount)));
    if (response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
  }

  Future<String> getRandom(final int amount) async {
    return "";
  }
}