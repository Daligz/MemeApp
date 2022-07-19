import 'package:flutter/material.dart';
import 'package:pruebapp/service/commons/favorite.dart';
import 'package:pruebapp/service/commons/post.dart';
import 'package:pruebapp/service/structures/posts_structure.dart';
import 'package:pruebapp/ventanas/constants/IconsConst.dart';

import '../../sensor/authentication.dart';
import '../../service/structures/favorites_structure.dart';

class ContainerPostComponent extends StatefulWidget {

  final Post post;

  const ContainerPostComponent(this.post);

  @override
  _ContainerPostComponentState createState() => _ContainerPostComponentState(post);
}

class _ContainerPostComponentState extends State<ContainerPostComponent> {

  final Post post;
  bool isFavorite = false;
  String reactions = "-";

  _ContainerPostComponentState(this.post);

  @override
  void initState() {
    super.initState();
    loadReactions();
  }

  Future loadReactions() async {
    final String reactionValue = await PostStructure().getReactions(post.id);
    final bool isFavoriteCache = await FavoriteStructure().exists(post.id.toString());
    setState(() => {
      reactions = reactionValue,
      isFavorite = isFavoriteCache
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Container(
        decoration: _cardDecoration(),
        height: 400.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const SizedBox(height: 5.0),
                Text(
                    post.category
                ),
                const SizedBox(height: 5.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        post.image,
                        height: 275.0,
                        width: 300.0,
                        fit: BoxFit.fill
                    )
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget> [
                    Row(
                      children: <Widget> [
                        FittedBox(
                          fit: BoxFit.fill,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '$reactions reactions'
                          ),
                        )
                      ]
                    ),
                    const SizedBox(width: 150.0),
                    Row(
                      children: <Widget> [
                        _favIcon()
                      ]
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _favIcon() {
    return GestureDetector(
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 150),
        firstChild: IconsConst.iconHeartFilled,
        secondChild: IconsConst.iconHeart,
        crossFadeState: isFavorite ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
      onTap: () {
        check();
      },
    );
  }

  void check() {
    final structure = FavoriteStructure();
    final postId = post.id.toString();
    setState(() {
      (isFavorite) ? structure.delete(postId) : structure.insert(postId);
      reactions = (isFavorite) ? (int.parse(reactions)-1).toString() : (int.parse(reactions)+1).toString();
      isFavorite = !(isFavorite);
    });
  }

  void updateReactions() async {
    final String reactionValue = await PostStructure().getReactions(post.id);
    setState(() => reactions = reactionValue);
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const <BoxShadow> [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0
          )
        ]
    );
  }
}