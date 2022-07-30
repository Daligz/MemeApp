import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pruebapp/service/structures/posts_structure.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';
import 'package:pruebapp/ventanas/favorites.dart';
import 'package:pruebapp/ventanas/posts.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> with SingleTickerProviderStateMixin {

  final controller = ScrollController();
  late TabController _tabController;
  bool loaded = false;

  final String categoryTypeRandom = "Random", categoryTypeSports = "Deportes", categoryTypeTransport = "Transporte",
      categoryTypePeople = "Personas", categoryTypeFood = "Comida";

  late PostsView categoryRandom;
  late PostsView categorySports;
  late PostsView categoryTransport;
  late PostsView categoryPeople;
  late PostsView categoryFood;

  List<Widget> tabList = [
    const Tab(icon: Icon(
        Ionicons.camera,
        color: Colors.white
    )),
    const Tab(icon: Icon(
        Ionicons.american_football,
        color: Colors.white
    )),
    const Tab(icon: Icon(
        Ionicons.bus,
        color: Colors.white
    )),
    const Tab(icon: Icon(
        Ionicons.people,
        color: Colors.white
    )),
    const Tab(icon: Icon(
        Ionicons.restaurant,
        color: Colors.white
    ))
  ];

  @override
  void initState() {
    super.initState();
    loadPosts();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  void loadPosts() async {
    final structure = PostStructure();
    final _categoryRandom = await structure.getRandom(20);
    final _categorySports = await structure.get(categoryTypeSports, 20);
    final _categoryTransport = await structure.get(categoryTypeTransport, 20);
    final _categoryPeople = await structure.get(categoryTypePeople, 20);
    final _categoryFood = await structure.get(categoryTypeFood, 20);
    setState(() => {
      categoryRandom = PostsView(_categoryRandom),
      categorySports = PostsView(_categorySports),
      categoryTransport = PostsView(_categoryTransport),
      categoryPeople = PostsView(_categoryPeople),
      categoryFood = PostsView(_categoryFood),
      loaded = true
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ColorsConst.pageBackground,
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: ColorsConst.tabBlue,
        elevation: 0,
        title: const Text(
          'Memes',
          style: TextStyle(
            color: ColorsConst.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              _favoriteView(context),
            ],
          ),
        ],
        bottom: TabBar(
          onTap: (index) { },
          controller: _tabController,
          tabs: tabList,
          indicatorColor: Colors.white,
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget> [
          (!loaded) ? const LinearProgressIndicator() : categoryRandom,
          (!loaded) ? const LinearProgressIndicator() : categorySports,
          (!loaded) ? const LinearProgressIndicator() : categoryTransport,
          (!loaded) ? const LinearProgressIndicator() : categoryPeople,
          (!loaded) ? const LinearProgressIndicator() : categoryFood
        ],
      ),
    );
  }
}

Widget _favoriteView(context){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100)
    ),
    child: Row(
      children: <Widget> [
        IconButton(
          iconSize: 35.0,
          icon: const Icon(
            Icons.favorite,
            color: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favorites()));
          },
        ),
        const SizedBox(width: 15.0)
      ],
    )
  );
}

