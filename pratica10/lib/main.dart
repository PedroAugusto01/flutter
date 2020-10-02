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
  somar() {
    int num01 = int.tryParse(this.num01Controller.text);
    int num02 = int.tryParse(this.num02Controller.text);
    int soma = num01 + num02;
    this.resp = '$num01 + $num02 = $soma';
    return this.resp;
  }

  subtracao() {
    int num01 = int.tryParse(this.num01Controller.text);
    int num02 = int.tryParse(this.num02Controller.text);
    int subtracao = num01 - num02;
    this.resp = '$num01 - $num02 = $subtracao';
    return this.resp;
  }

  multiplicacao() {
    int num01 = int.tryParse(this.num01Controller.text);
    int num02 = int.tryParse(this.num02Controller.text);
    int multiplicacao = num01 * num02;
    this.resp = '$num01 * $num02 = $multiplicacao';
    return this.resp;
  }

  div() {
    int num01 = int.tryParse(this.num01Controller.text);
    int num02 = int.tryParse(this.num02Controller.text);
    double div = num01 / num02;
    this.resp = '$num01 / $num02 = $div';
    return this.resp;
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
                labelText: 'informe o primeiro número',
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
                labelText: 'informe o segundo número',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  print(somar());
                  setState(somar);
                },
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(subtracao());
                  setState(subtracao);
                },
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(multiplicacao());
                  setState(multiplicacao);
                },
                child: Text(
                  'x',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(div());
                  setState(div);
                },
                child: Text(
                  '/',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.black,
              width: 280.0,
              height: 65.0,
              child: Text(
                this.resp,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
