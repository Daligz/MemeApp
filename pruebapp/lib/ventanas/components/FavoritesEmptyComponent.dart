import 'package:flutter/material.dart';
import 'package:pruebapp/ventanas/constants/ColorsConst.dart';

class FavoritesEmptyComponent extends StatelessWidget {

  const FavoritesEmptyComponent({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
              Text(
                '¡No tienes favoritos!',
                style: TextStyle(
                  color: ColorsConst.tabBlue,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          const SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://c.tenor.com/HKUc3og5OxAAAAAM/gato-cat.gif',
                  height: 300.0,
                  width: 300.0,
                  fit: BoxFit.fill
                )
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
              Text(
                '¡Intenta ver alguna categoria de interes!',
                style: TextStyle(
                    color: ColorsConst.tabBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          const SizedBox(height: 100.0)
        ],
      )
    );
  }
}