import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pruebapp/service/commons/post.dart';

import '../service_routes.dart';

class PostStructure {

  Future<String> getReactions(final int postId) async {
    final http.Response response = await http.get(Uri.parse(Routes.routePostGetReactions(postId)));
    if (response.statusCode != 200) return "0";
    return response.body;
  }

  Future<List<Post>> get(final String category, final int amount) async {
    final http.Response response = await http.get(Uri.parse(Routes.routePostGet(category, amount)));
    if (response.statusCode != 200) return List.empty();
    return (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Post>> getRandom(final int amount) async {
    final http.Response response = await http.get(Uri.parse(Routes.routePostGetAll(amount)));
    if (response.statusCode != 200) return List.empty();
    final List<Post> posts = (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
    posts.shuffle();
    return posts.getRange(0, amount).toList();
  }
}