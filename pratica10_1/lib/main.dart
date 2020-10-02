import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();
  String resp = "";
  double imC = 0;

  imc() {
    double peso = double.tryParse(this.num01Controller.text);
    double altura = double.tryParse(this.num02Controller.text);
    imC = peso / (altura * altura);
    this.resp = '$peso / ($altura * $altura) = $imC';
    checkClass();
    return this.resp;
  }

  String clas = "";
  checkClass() {
    if (imC < 16) {
      clas = "A classificação e magreza grave";
    } else if (imC > 16 && imC < 17) {
      clas = "A classificação e magreza moderada";
    } else if (imC >= 17 && imC < 18.5) {
      clas = "A classificação e magreza leve";
    } else if (imC >= 18.5 && imC < 25) {
      clas = "A classificação e saudável";
    } else if (imC >= 25 && imC < 30) {
      clas = "A classificação e obeso";
    } else if (imC >= 30 && imC < 35) {
      clas = "A classificação e obesidade grau 1";
    } else if (imC >= 35 && imC < 40) {
      clas = "A classificação e obesidade grau 2";
    } else if (imC >= 40) {
      clas = "A classificação e obesidade grau 3";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o peso',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a altura',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              print(imc());
              setState(imc);
            },
            child: Text(
              'Calcular MMC',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            clas,
            style: TextStyle(
              fontSize: 25,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
