import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pruebapp/ventanas/favoritos.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Main extends StatelessWidget {

  final controller = ScrollController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Color(0XFFA96DBB),
        elevation: 0,
        title: Text(
            'Memes',
            style: TextStyle(
              color: Color(0XFF000000),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        ),
        actions: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
                   ),
              child: Icon(
                FontAwesomeIcons.heartCircleCheck,
                color: Colors.black,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Fav'),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SegundaPagina()));
        },
        ),
      ),
    );
  }
}