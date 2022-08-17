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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Hola mundo 1'),
                  ),
                  Icon(
                    Icons.analytics,
                    size: 40,
                  ),
                  Switch(value: true, onChanged: (value) {})
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Hola mundo 2'),
                  ),
                  Icon(
                    Icons.analytics,
                    size: 40,
                  ),
                  Switch(value: true, onChanged: (value) {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.black,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  )
                ],
              )
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
