import 'package:flutter/material.dart';

class Consultoria extends StatefulWidget {
  State<StatefulWidget> createState() => _Consultoria();
}

class _Consultoria extends State<Consultoria> with WidgetsBindingObserver {
  @override
    Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25.0),
        child: Image( image: NetworkImage( 'https://flutter.io/images/catalog-widget-placeholder.png'), 
        ),
      );
    }
}
