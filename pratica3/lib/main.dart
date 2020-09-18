import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  String nome = "Ana";
  String dia = "Hoje e Sexta feira!";

  runApp(
    
    Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: "Olá, ",
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '$nome',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            TextSpan(
              text: '! \n$dia',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            TextSpan(
              text: '! \nBom dia!',
            ),
          ],
        ),
      ),
    ),
  );
}
