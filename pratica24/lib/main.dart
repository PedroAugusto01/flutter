import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Produto {
  String url, nome, descricao;
  double preco;

  Produto({
    this.url,
    this.nome,
    this.descricao,
    this.preco,
  });
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
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Container(
            height: 80,
            margin: EdgeInsets.all(2),
            color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
            child: ListTile(
              leading: Image(
                  image: NetworkImage('https://picsum.photos/250?image=9')),
              title: Text(
                '${produtos[indice].nome}',
              ),
              subtitle: Text(
                'R\$ ${produtos[indice].preco.toStringAsFixed(2)}',
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

class SegundaRota extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: urlController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'URL da foto',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'descrição',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'preço',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 30, 130, 100),
            child: ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Produto produto = Produto(
                  url: this.urlController.text,
                  nome: this.nomeController.text,
                  descricao: this.descricaoController.text,
                  preco: double.tryParse(precoController.text),
                );
                Navigator.pop(context, produto);
              },
            ),
          ),
        ],
      ),
    );
  }
}
