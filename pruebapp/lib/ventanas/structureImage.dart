import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Imagenes"),
      ),
      body: Estructura(),
    ));
  }
}

class Estructura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Encabezado
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Image.asset('imags/IM1.jpg'),
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Text(
                    'Imgs',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),

        //Aqui van dentro las imagenes
        Image.network(
          '',
        ),

        //Parte de favorito
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _botonFavorit(),
              /*Row(
                  //Icon(Icons.favorite),
                  ),*/
            ],
          ),
        ),
      ],
    );
  }
}

Widget _botonFavorit() {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
    child: RaisedButton(
      child: IconButton(
        iconSize: 40.0,
        icon: Icon(
          FontAwesomeIcons.heart,
          color: Colors.black,
        ),
        onPressed: () {
          //Debe de dejarlo en favorito
        },
      ),
      onPressed: () {},
    ),
  );
}
