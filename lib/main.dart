import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar'),
          actions: <Widget>[
            IconButton(onPressed: _loginDummy, icon: const Icon(Icons.login))
          ],
          backgroundColor: Colors.grey,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // vertical
            crossAxisAlignment: CrossAxisAlignment.center, // horizontal
            children: <Widget>[
              Container(
                color: Colors.orange,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 59,
              ),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
              Text('Hola mundo'),
            ],
          ),
        ),

        drawer: Drawer(),
        // endDrawer: Drawer(),
        // backgroundColor: Colors.black,
      ),
    );
  }

  void _loginDummy() {
    print("Hola mundo");
  }
}
