import 'package:flutter/material.dart';
import './main.dart';

void main() => runApp(TerceiraRota());

class TerceiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _TerceiraRota(),
    );
  }
}

class _TerceiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terceira rota'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: "Terceira Tela",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Voltar para a primeira rota "),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrimeiraRota()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}