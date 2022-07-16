import 'package:flutter/material.dart';
import 'package:pruebapp/ventanas/constants/IconsConst.dart';

class ContainerComponent extends StatelessWidget {

  const ContainerComponent();

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Container(
        decoration: _cardDecoration(),
        height: 370.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const SizedBox(height: 5.0),
                const Text(
                  'Animales'
                ),
                const SizedBox(height: 5.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        'https://static1.patasdacasa.com.br/articles/1/25/41/@/10986-nao-sabe-como-apresentar-gato-filhote-a-opengraph_1200-1.jpg',
                        height: 275.0,
                        width: 250.0,
                        fit: BoxFit.fill
                    )
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: const <Widget> [
                    SizedBox(width: 200.0),
                    IconsConst.iconHeartFilled
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const <BoxShadow> [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(2.0, 2.0),
              blurRadius: 8.0
          )
        ]
    );
  }
}