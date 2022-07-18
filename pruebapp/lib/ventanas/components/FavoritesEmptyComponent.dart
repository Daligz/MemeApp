import 'package:flutter/material.dart';

class FavoritesEmptyComponent extends StatelessWidget {

  const FavoritesEmptyComponent({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
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
                'https://www.barakaldotiendaveterinaria.es/blog/wp-content/uploads/2017/02/gato-con-ordenador.jpg',
                height: 275.0,
                width: 300.0,
                fit: BoxFit.fill
            )
        )
      ],
    );
  }
}