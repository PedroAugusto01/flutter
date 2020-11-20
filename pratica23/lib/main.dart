import 'package:flutter/material.dart';
import 'package:pratica23/segundaRota.dart';

main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Produto {
  int id;
  String url, nome, descricao;
  double preco;
  Produto({this.id, this.url, this.nome, this.descricao, this.preco});
  static List<Produto> produtos() {
    return [
      Produto(
          id: 1,
          url: 'https://picsum.photos/250?image=9',
          nome: 'Notebook Samsung',
          descricao: 'Notebook Samsung - 8GB - I3 - Cinza',
          preco: 30109.98),
      Produto(
          id: 2,
          url:
              'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          nome: 'Panquecas',
          descricao: 'Panquecas com Amoras e Nozes',
          preco: 15.19),
      Produto(
          id: 3,
          url:
              'https://images.pexels.com/photos/213798/pexels-photo-213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          nome: 'Torre Eólica',
          descricao: 'Torre de Energia Eólica',
          preco: 50125.47),
    ];
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  final List<Produto> produtos = <Produto>[];
  void adicionarProdutoNaLista(Produto produto) {
    setState(
      () {
        produtos.insert(0, produto);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 25, top: 2.5, right: 25),
        //padding: EdgeInsets.all(8),
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Container(
            height: 80,
            margin: EdgeInsets.all(2),
            color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
            child: ListTile(
              leading: Image(
                image: NetworkImage(this.produtos[indice].url),
                height: 50,
                width: 70,
              ),
              title: Text('${this.produtos[indice].nome}'),
              subtitle: Text(
                'R\$ ${this.produtos[indice].preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.purple[900],
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SegundaRota()),
          ).then((novoProduto) {
            adicionarProdutoNaLista(novoProduto);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}