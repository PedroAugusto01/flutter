import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  final _temperaturaCelsiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graus Celsius'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _temperaturaCelsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => _temperaturaCelsiusController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'temperatura em graus Celsius',
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RotaGenerica.caminhoDaRota,
                  arguments: ArgumentosDaRota(
                    'Segunda Rota',
                    double.tryParse(_temperaturaCelsiusController.text),
                  ),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Text('Converter', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArgumentosDaRota {
  String titulo;
  double celsius;
  ArgumentosDaRota(this.titulo, this.celsius);
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';
  converter(double celsius) => celsius * 1.8 + 32;
  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.titulo),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Graus Celsius: ${argumentos.celsius.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Graus Fahrenheit: ${converter(argumentos.celsius).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
