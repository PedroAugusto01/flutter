import 'package:flutter/material.dart';
import './segundaRota.dart';
import './terceiraRota.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text("Ana"),
              accountEmail: Text("ana@ana.com.br"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.video_collection),
              title: Text("Rota 02"),
              subtitle: Text("Siga para a Rota 02."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaRota()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Rota 03"),
              subtitle: Text("Siga para a Rota 03"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TerceiraRota()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Rota 01"),
              subtitle: Text("Voltar para a Rota 01"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Voltar para a Rota 01.');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}
