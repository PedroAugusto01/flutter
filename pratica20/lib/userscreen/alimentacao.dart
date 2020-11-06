import 'package:flutter/material.dart';

class Avaliacao extends StatefulWidget {
  State<StatefulWidget> createState() => _Avaliacao();
}

class _Avaliacao extends State<Avaliacao> with WidgetsBindingObserver {
  @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25.0),
        child: Image( image: NetworkImage( 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'), 
        ),
      );
    }
}
