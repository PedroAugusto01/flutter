import 'package:flutter/material.dart';

class Curso extends StatefulWidget {
  State<StatefulWidget> createState() => _Curso();
}

class _Curso extends State<Curso> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25.0),
        child: Image( image: NetworkImage( 'https://images.unsplash.com/photo-1547721064-da6cfb341d50'), 
        ),
      );
  }
}
