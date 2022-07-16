import 'package:flutter/material.dart';
import 'package:pruebapp/service/commons/post.dart';
import 'package:pruebapp/service/structures/posts_structure.dart';
import 'package:pruebapp/ventanas/components/ContainerComponent.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Favorites extends StatefulWidget {

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  late bool loading;
  late List<Post> posts;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    loading = true;
    getData();
  }

  Future getData() async {
    final List<Post> postsData = await PostStructure().getRandom(3);
    setState(() {
      posts = postsData;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: _controller,
        backgroundColor: ColorsConst.background,
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: ColorsConst.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: !loading ? SingleChildScrollView(
        controller: _controller,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          itemBuilder: (context, index) => ContainerComponent(posts[index])
        )
      ) : const LinearProgressIndicator()
    );
  }
}
