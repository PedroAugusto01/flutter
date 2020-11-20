import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: Inicio(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Inicio extends StatefulWidget {
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  int indice = 0;
  final List<Widget> rotas = [PrimeiraRota(), SegundaRota()];
  void aoPressionar(int rotaSelecionada) {
    setState(
      () {
        this.indice = rotaSelecionada;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rotas[this.indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.indice,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Primeira Rota', //substituir por -> label: 'Primeira Rota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Segunda Rota', //substituir por -> label: 'Segunda Rota',
          ),
        ],
        onTap: (int pageTapped) {
          aoPressionar(pageTapped);
        },
      ),
    );
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );

    return Center(
      child: Text(
        'Primeira Rota',
        style: estilo,
      ),
    );
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Text(
              'Galeria',
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Cartao(
          titulo: 'Montanhas',
          subtitulo:
              'Sagittis cubilia enim nec imperdiet velit enim volutpat imperdiet, etiam tellus maecenas cras amet sagittis id himenaeos etiam, orci convallis integer rhoncus convallis risus consectetur. malesuada pellentesque quisque maecenas nam ultricies nisl viverra, nullam curabitur tortor lacinia purus mollis ipsum, phasellus consequat augue urna condimentum justo.',
          preco: 3.10,
          url:
              'https://images.pexels.com/photos/213795/pexels-photo-213795.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Natureza',
          subtitulo:
              'urna mollis fermentum augue class scelerisque venenatis aliquam suscipit, mi urna diam neque quis praesent suscipit taciti dapibus, magna vulputate feugiat erat etiam vulputate eget. eleifend morbi vitae curabitur placerat fringilla quis per felis platea.',
          preco: 2.15,
          url:
              'https://images.pexels.com/photos/213791/pexels-photo-213791.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Flor',
          subtitulo:
              'praesent feugiat nisl torquent gravida orci elit congue sed rhoncus, lacus nec curabitur varius massa consequat nec consectetur.',
          preco: 2.95,
          url:
              'https://images.pexels.com/photos/213797/pexels-photo-213797.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Cartao(
          titulo: 'Energia Eólica',
          subtitulo:
              'Consequat etiam consequat rutrum dolor convallis litora venenatis, eu phasellus conubia luctus velit faucibus ut et, fusce lectus sociosqu senectus fusce semper. dapibus volutpat class eleifend at aliquam ipsum dapibus tristique.',
          preco: 1.97,
          url:
              'https://images.pexels.com/photos/213798/pexels-photo-213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
      ],
    ));
  }
}

class Detalhes extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double preco;
  final String url;

  Detalhes({this.titulo, this.subtitulo, this.preco, this.url});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[100],
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                      image: NetworkImage(this.url),
                      height: 200,
                      width: 400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${this.titulo}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '${this.subtitulo}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${this.preco.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Voltar para a Segunda Rota'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ])));
  }
}

class Cartao extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double preco;
  final String url;
  Cartao({this.titulo, this.subtitulo, this.preco, this.url});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                image: NetworkImage(this.url),
                height: 200,
                width: 400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.titulo,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                this.subtitulo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                'R\$ ${this.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('DETALHES'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detalhes(
                                titulo: this.titulo,
                                subtitulo: this.subtitulo,
                                preco: this.preco,
                                url: this.url)));
                  },
                ),
                FlatButton(
                  child: Text('COMPRAR'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Compra()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Compra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.all(4),
        child: Text('Pagina de compra'),
      ),
      ButtonBar(
        children: [
          FlatButton(
            child: Text('Voltar para segunda rota'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )
    ]));
  }
}