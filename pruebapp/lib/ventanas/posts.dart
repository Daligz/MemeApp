import 'package:flutter/material.dart';
import 'package:pruebapp/service/commons/post.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import 'components/ContainerPostComponent.dart';
import 'components/FavoritesEmptyComponent.dart';
import 'constants/ColorsConst.dart';

class PostsView extends StatefulWidget {

  final List<Post> posts;

  PostsView(this.posts);

  @override
  _PostsViewState createState() => _PostsViewState(posts);
}

class _PostsViewState extends State<PostsView> {

  late bool loading;
  late bool empty;
  final List<Post> posts;
  final _controller = ScrollController();

  _PostsViewState(this.posts);

  @override
  void initState() {
    super.initState();
    loading = true;
    empty = true;
    getData();
  }

  Future getData() async {
    setState(() {
      loading = false;
      empty = !(posts.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return !loading ? empty ? const FavoritesEmptyComponent() :  SingleChildScrollView(
      controller: _controller,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) => ContainerPostComponent(posts[index])
      )
    ) : const LinearProgressIndicator();
  }
}
