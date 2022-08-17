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
        body: Column(
          children: <Widget>[
            Text("Hola"),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Bienvenidos"),
            ),
          ],
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
