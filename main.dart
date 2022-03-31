import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("İhtiyaçlar Listesi")),
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, index) => ListTile(
                subtitle: Text("İhtiyaçlar"),
                title: Text(alisverisListesi[index]),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          RaisedButton(
            onPressed: elemanEkle,
            child: Text("Ekle"),
          ),
          RaisedButton(
            onPressed: elemanCikar,
            child: Text("Cikar"),
          ),
        ],
      ),
    );
  }
}
