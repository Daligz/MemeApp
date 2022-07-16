import 'package:flutter/material.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';

class ContainerComponent extends StatelessWidget {

  const ContainerComponent();

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        const Text(
          "Title",
          style: TextStyle(
            fontSize: 150.0,
            color: ColorsConst.background
          ),

        )
      ],
    );
  }
}