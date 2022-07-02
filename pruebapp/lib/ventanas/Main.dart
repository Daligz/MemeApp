import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pruebapp/ventanas/favoritos.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Main extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
        child: Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Color(0XFFA96DBB),
        elevation: 0,
        title: Text(
            'Memes',
            style: TextStyle(
              color: Color(0XFF000000),
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
        child:  Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Ionicons.american_football,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Ionicons.fast_food,
                    color: Colors.black,
                  ),
                ),
              ],
            )
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
      child:  IconButton(
        iconSize: 40.0,
        icon: Icon(
          FontAwesomeIcons.heartCircleCheck,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SegundaPagina()));
        },
      ),
      onPressed: (){
      },
    ),
  );
}

