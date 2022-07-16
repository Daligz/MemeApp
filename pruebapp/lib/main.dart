import 'package:flutter/material.dart';
import 'package:pruebapp/service/service.dart';
import 'package:pruebapp/ventanas/favorites.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorites()
    );
  }
}

class Tester {

  final Service _service = Service();

  void registerDevice() {
    print("Registering device...");
    _service.registerDevice().then((value) => {
      if (value) {
        print("Dispositivo registrado!")
      } else {
        print("Error...")
      }
    });
  }

  void getPost() {
    print("Getting posts...");
    _service.getPost().then((value) => print(value)).onError((error, stackTrace) => print("Chale : $error"));
  }
}
