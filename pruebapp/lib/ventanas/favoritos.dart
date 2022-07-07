import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class SegundaPagina extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: Color(0XFF0B2545),
        elevation: 0,
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: Color(0XFFEEF4ED),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
