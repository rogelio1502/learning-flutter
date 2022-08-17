import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<String> names = ['Rogelio', 'Susana', 'Javier'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
        actions: <Widget>[
          IconButton(onPressed: _loginDummy, icon: const Icon(Icons.login))
        ],
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            final name = names[index];
            return Card(
              child: Text(name),
            );
          }),

      drawer: Drawer(),
      // endDrawer: Drawer(),
      // backgroundColor: Colors.black,
    );
  }

  void _loginDummy() {
    print("Hola mundo");
  }
}
