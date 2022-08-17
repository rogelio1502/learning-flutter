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
        body: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(55),
          child: Text(
            "-----",
            style: TextStyle(
                backgroundColor: Colors.black,
                fontSize: 60,
                color: Colors.white),
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
