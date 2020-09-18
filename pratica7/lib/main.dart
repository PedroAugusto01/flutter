import 'package:flutter/material.dart';

void main() {
  runApp(Center(
    child: Container(
      child: Expanded(
        child: Image.asset(
          'assets/images/photo-1547721064-da6cfb341d50.jpg',
          width: 100,
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      padding: EdgeInsets.all(40),
      margin: const EdgeInsets.all(25),
    ),
  ));
}
