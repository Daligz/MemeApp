import 'package:flutter/material.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Favorites extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        backgroundColor: ColorsConst.background,
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: ColorsConst.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
