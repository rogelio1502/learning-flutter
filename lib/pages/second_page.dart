import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    SecondPageArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SecondPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name),
      ),
      body: Center(
        child: Text(arguments.lastName),
      ),
    );
  }
}

class SecondPageArguments {
  String name;
  String lastName;
  SecondPageArguments({required this.name, required this.lastName});
}
