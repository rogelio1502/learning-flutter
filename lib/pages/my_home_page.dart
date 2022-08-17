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

  late final FocusNode nameFocusNode;
  late final FocusNode lastNameFocusNode;
  late final FocusNode phoneNumberFocusNode;
  late final FocusNode emailFocusNode;

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
                  focusNode: nameFocusNode,
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
                  onEditingComplete: () {
                    requestFocus(context, lastNameFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  focusNode: lastNameFocusNode,
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
                  onEditingComplete: () {
                    requestFocus(context, phoneNumberFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  focusNode: phoneNumberFocusNode,
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
                  onEditingComplete: () {
                    requestFocus(context, emailFocusNode);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  focusNode: emailFocusNode,
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

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void _showSecondPage(BuildContext context) {
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
    nameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();
    nameFocusNode.dispose();
    lastNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    emailFocusNode.dispose();
  }
}
