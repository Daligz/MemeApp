import 'package:flutter/material.dart';
import 'package:pruebapp/service/service.dart';
import 'package:pruebapp/ventanas/structureImage.dart';

void main() {
  runApp(MyApp());
  final Tester tester = Tester();
  tester.registerDevice();
  tester.getPost();
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

class Tester {

  final Service _service = Service();

  void registerDevice() {
    print("Registering device...");
    _service.registerDevice().then((value) => {
      print("DATA GETTED!"),
      print(value.body)
    });
  }

  void getPost() {
    print("Getting posts...");
    // _service.getPost().then((value) => print(value)).onError((error, stackTrace) => print("Chale : $error"));
  }
}
