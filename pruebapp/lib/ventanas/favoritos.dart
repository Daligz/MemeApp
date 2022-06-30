import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos'),),
      body: Center(
        child: RaisedButton(child: Text('Regresar'),
          onPressed: (){
          Navigator.pop(context);
          },),
      ),
    );
  }
}