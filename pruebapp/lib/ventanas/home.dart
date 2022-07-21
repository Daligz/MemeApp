import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pruebapp/service/structures/posts_structure.dart';
import 'package:pruebapp/ventanas/components/FavoritesEmptyComponent.dart';
import 'package:pruebapp/ventanas/favorites.dart';
import 'package:pruebapp/ventanas/posts.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../service/commons/post.dart';
import 'components/ContainerPostComponent.dart';

class Home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> with SingleTickerProviderStateMixin {

  final controller = ScrollController();
  late TabController _tabController;
  int _selectedIndex = 0;
  final posts = <String, List<Post>>{};

  final String categoryTypeRandom = "Random", categoryTypeSports = "Deportes", categoryTypeTransport = "Transporte",
      categoryTypePeople = "Personas", categoryTypeFood = "Comida";

  PostsView postsView = PostsView(List.empty());

  List<Widget> list = [
    const Tab(icon: Icon(
        Ionicons.camera,
        color: Colors.black
    )),
    const Tab(icon: Icon(
        Ionicons.american_football,
        color: Colors.black
    )),
    const Tab(icon: Icon(
        Ionicons.bus,
        color: Colors.black
    )),
    const Tab(icon: Icon(
        Ionicons.people,
        color: Colors.black
    )),
    const Tab(icon: Icon(
        Ionicons.restaurant,
        color: Colors.black
    ))
  ];

  @override
  void initState() {
    super.initState();
    loadPosts();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }

  void loadPosts() async {
    final structure = PostStructure();
    final categoryRandom = await structure.getRandom(20);
    final categorySports = await structure.get(categoryTypeSports, 20);
    final categoryTransport = await structure.get(categoryTypeTransport, 20);
    final categoryPeople = await structure.get(categoryTypePeople, 20);
    final categoryFood = await structure.get(categoryTypeFood, 20);
    setState(() => {
      posts.putIfAbsent("Random", () => categoryRandom),
      posts.putIfAbsent("Deportes", () => categorySports),
      posts.putIfAbsent("Transporte", () => categoryTransport),
      posts.putIfAbsent("Personas", () => categoryPeople),
      posts.putIfAbsent("Comida", () => categoryFood),
      postsView = PostsView(categoryRandom)
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: const Color(0XFF134074),
        elevation: 0,
        title: const Text(
          'Memes',
          style: TextStyle(
            color: Color(0XFFEEF4ED),
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
      )
    );
  }
}

Widget _favoriteView(context){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100)
    ),
    child: RaisedButton(
      color: const Color(0xFF134074),
      child:  IconButton(
        iconSize: 35.0,
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favorites()));
        },
      ),
      onPressed: (){
      },
    ),
  );
}

