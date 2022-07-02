import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class SegundaPagina extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Color(0XFFA96DBB),
        elevation: 0,
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: Color(0XFF000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
