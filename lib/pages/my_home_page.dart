import 'package:flutter/material.dart';
import 'package:my_app/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(labelText: "Nombre"),
              controller: nameTextController,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(labelText: "Apellido"),
              controller: lastNameTextController,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: RaisedButton(
              child: const Text("Mostrar segunda pantalla"),
              onPressed: () {
                _showSecondPage(context);
              },
            ),
          )
        ],
      ),
    );
  }

  _showSecondPage(BuildContext context) {
    // final route = MaterialPageRoute(builder: (BuildContext context) {
    //   return SecondPage(
    //     name: "Marvin",
    //   );
    // });
    // Navigator.of(context).push(route);

    Navigator.of(context).pushNamed("/second",
        arguments: SecondPageArguments(
          name: nameTextController.text,
          lastName: lastNameTextController.text,
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hola mundo");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    nameTextController.dispose();
    lastNameTextController.dispose();
  }
}
