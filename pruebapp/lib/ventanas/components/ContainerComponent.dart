import 'package:flutter/material.dart';
import 'package:pruebapp/service/commons/favorite.dart';
import 'package:pruebapp/ventanas/constants/IconsConst.dart';

class ContainerComponent extends StatelessWidget {

  final Favorite favorite;

  const ContainerComponent(this.favorite);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: Container(
        decoration: _cardDecoration(),
        height: 400.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const SizedBox(height: 5.0),
                Text(
                    favorite.category
                ),
                const SizedBox(height: 5.0),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        favorite.image,
                        height: 275.0,
                        width: 300.0,
                        fit: BoxFit.fill
                    )
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget> [
                    Row(
                      children: const <Widget> [
                        FittedBox(
                          fit: BoxFit.fill,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '2 reactions'
                          ),
                        )
                      ]
                    ),
                    const SizedBox(width: 150.0),
                    Row(
                      children: const <Widget> [
                        IconsConst.iconHeartFilled
                      ]
                    )
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