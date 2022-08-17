import 'package:flutter/material.dart';
import 'package:my_app/pages/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameTextController = TextEditingController(text: "Rogelio");
  final lastNameTextController = TextEditingController(text: "Torres");

  String nameValue = '';
  String lastNameValue = '';

  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: nameTextController,
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                  ),
                  onSaved: (newValue) {
                    nameValue = newValue.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameTextController,
                  decoration: const InputDecoration(
                    labelText: "Apellido",
                  ),
                  onSaved: (newValue) {
                    lastNameValue = newValue.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Número de telefono",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
              ]),
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
          ),
        ],
      ),
    );
  }

  _showSecondPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pushNamed("/second",
          arguments: SecondPageArguments(
            name: nameValue,
            lastName: lastNameValue,
          ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();
  }
}
