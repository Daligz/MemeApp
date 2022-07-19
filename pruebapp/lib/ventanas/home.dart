import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pruebapp/service/structures/posts_structure.dart';
import 'package:pruebapp/ventanas/favorites.dart';
import 'package:pruebapp/ventanas/posts.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../service/commons/post.dart';
import 'components/ContainerPostComponent.dart';

class Home extends StatefulWidget {

  final controller = ScrollController();

  @override
  _homeState createState() => _homeState(controller);
}

class _homeState extends State<Home> {

  final controller;
  final posts = <String, List<Post>>{};

  final String categoryTypeRandom = "Random", categoryTypeSports = "Deportes", categoryTypeTransport = "Transporte",
      categoryTypePeople = "Personas", categoryTypeFood = "Comida";

  _homeState(this.controller);

  @override
  void initState() {
    super.initState();
    loadPosts();
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
    });
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
              _accionesApp(context),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: IconButton(
                    icon: const Icon(
                      Ionicons.camera,
                      color: Colors.black
                    ),
                    onPressed: () => {},
                  )
                ),
                Tab(
                  icon: IconButton(
                    icon: const Icon(
                      Ionicons.american_football,
                      color: Colors.black
                    ),
                    onPressed: () => {},
                  )
                ),
                Tab(
                  icon: IconButton(
                    icon: const Icon(
                      Ionicons.bus,
                      color: Colors.black
                    ),
                    onPressed: () => {},
                  )
                ),
                Tab(
                  icon: IconButton(
                    icon: const Icon(
                      Ionicons.people,
                      color: Colors.black
                    ),
                    onPressed: () => {},
                  )
                ),
                Tab(
                  icon: IconButton(
                    icon: const Icon(
                      Ionicons.restaurant,
                      color: Colors.black
                    ),
                    onPressed: () => {},
                  )
                ),
              ],
            ),

          ],
        ),
      ),
        ),
    );
  }
}

Widget _accionesApp(context){
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorites()));
        },
      ),
      onPressed: (){
      },
    ),
  );
}

