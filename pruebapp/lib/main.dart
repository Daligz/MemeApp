import 'package:flutter/material.dart';
import 'package:pruebapp/service/structures/users_structure.dart';
import 'package:pruebapp/ventanas/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Register device id
    UserStructure().insert();

    // Main screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorites()
    );
  }
}
