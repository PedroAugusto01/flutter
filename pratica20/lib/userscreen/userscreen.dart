import 'dart:io';
import 'package:flutter/material.dart';
import 'alimentacao.dart';
import 'programacao.dart';
import 'animais.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> with WidgetsBindingObserver {
  int indice = 0;
  static List<Widget> telas = <Widget>[
    Curso(),
    Consultoria(),
    Avaliacao(),
  ];
  void selecionar(int indice) {
    setState(
      () {
        this.indice = indice;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exit(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          automaticallyImplyLeading: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.home),
              label: 'Animais',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.business),
              label: 'Programação',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.warning_rounded),
              label: 'Alimentação',
            ),
          ],
          currentIndex: this.indice,
          selectedItemColor: Colors.red[0],
          onTap: selecionar,
        ),
        body: telas.elementAt(this.indice),
      ),
    );
  }
}
