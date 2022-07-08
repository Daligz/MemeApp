import 'package:flutter/material.dart';
import 'package:pruebapp/ventanas/Main.dart';
import 'package:pruebapp/ventanas/structureImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Images(),
    );
  }
}
