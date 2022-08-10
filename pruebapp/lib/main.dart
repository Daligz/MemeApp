import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:pruebapp/sensor/authentication.dart';
import 'package:pruebapp/service/service_routes.dart';
import 'package:pruebapp/service/structures/users_structure.dart';
import 'package:pruebapp/ventanas/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(final BuildContext context) {

    // Dev mode
    getIP(context);

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

  void getIP(final BuildContext context) async {
    final String? ip = await prompt(context);
    if (ip == null) {
      getIP(context);
    } else {
      Routes.url = "http://$ip:6969";
    }
  }
}
