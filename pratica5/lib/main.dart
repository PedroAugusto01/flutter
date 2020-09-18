import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Olá, Mundo!",
        textDirection: TextDirection.ltr,
      ),
      Text(
        'Este aplicativo usa o widget Column',
        textDirection: TextDirection.ltr,
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain, // Permite aumentar o tamanho da logo
          child: const FlutterLogo(),
        ),
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset('assets/images/notebook.jpg'),
        ),
      ),
      Text(
        'Google Flutter.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.white,
        ),
      )
    ],
  ));
}
