import 'package:flutter/material.dart';
import 'package:pruebapp/service/commons/favorite.dart';
import 'package:pruebapp/service/structures/favorites_structure.dart';
import 'package:pruebapp/ventanas/components/ContainerComponent.dart';
import 'package:pruebapp/ventanas/components/FavoritesEmptyComponent.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Favorites extends StatefulWidget {

  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  late bool loading;
  late bool empty;
  late List<Favorite> favorites;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    loading = true;
    empty = true;
    getData();
  }

  Future getData() async {
    final List<Favorite> favoritesData = await FavoriteStructure().getAll();
    setState(() {
      favorites = favoritesData;
      loading = false;
      empty = !(favoritesData.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.pageBackground,
      appBar: ScrollAppBar(
        controller: _controller,
        backgroundColor: ColorsConst.tabBlue,
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: ColorsConst.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: !loading ? empty ? const FavoritesEmptyComponent() :  SingleChildScrollView(
        controller: _controller,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: favorites.length,
          itemBuilder: (context, index) => ContainerComponent(favorites[index])
        )
      ) : const LinearProgressIndicator()
    );
  }
}
