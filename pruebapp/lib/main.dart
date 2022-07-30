import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pruebapp/sensor/authentication.dart';
import 'package:pruebapp/service/structures/users_structure.dart';
import 'package:pruebapp/ventanas/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Register device id
    UserStructure().insert();

    checkAuth();

    // Home screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }

  void checkAuth() async {
    if (!(await Authentication().hasPermission("Inicia sesion de forma segura"))) SystemNavigator.pop();
  }
}
