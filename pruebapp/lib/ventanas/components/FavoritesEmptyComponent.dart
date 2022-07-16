import 'package:flutter/material.dart';

class FavoritesEmptyComponent extends StatelessWidget {

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        const SizedBox(height: 25.0),
        const Text(
          '¡Primero debes guardar alguna imagen como favorita!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontStyle: FontStyle.italic
          ),
        ),
        const SizedBox(height: 25.0),
        ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
                'https://i.pinimg.com/originals/b3/ca/bc/b3cabcbb2b95dbfe42bd62699e12a3b7.gif',
                height: 275.0,
                width: 300.0,
                fit: BoxFit.fill
            )
        )
      ],
    );
  }
}