import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

// O objeto da classe mensagem será enviado para a segunda rota.
class Mensagem {
  double titulo;
  double texto;
  Mensagem(this.titulo, this.texto);
}

class PrimeiraRota extends StatelessWidget {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController textoController = TextEditingController();
  Mensagem mensagem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insira os valores"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tituloController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => tituloController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: textoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => textoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço do Gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              mensagem = Mensagem(double.parse(tituloController.text),
                  double.parse(textoController.text));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SegundaRota(mensagem)));
            },
            child: Text('Fazer o calculo'),
          ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Mensagem mensagem;
  SegundaRota(this.mensagem);

  @override
  Widget build(BuildContext context) {
    var resultado = mensagem.titulo / mensagem.texto;
    var mens;
    if (resultado > 0.70) {
      mens = 'Abasteça com gasolina!';
    } else {
      mens = 'Abasteça com alcool!';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              ('${mensagem.titulo} / ${mensagem.texto} = ${mensagem.titulo / mensagem.texto}'),
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$mens',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
