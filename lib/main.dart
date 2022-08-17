import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "Marvin";
  double progressValue = 0;
  bool changesEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateFull Widget'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          ),
          LinearProgressIndicator(
            value: progressValue,
          ),
          Switch(
              value: changesEnabled,
              onChanged: (value) {
                _enableChange(value);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.change_circle),
        onPressed: _changeName,
      ),
    );
  }

  void _enableChange(bool enable) {
    setState(() {
      changesEnabled = enable;
    });
  }

  void _changeName() {
    setState(() {
      if (name == "Rogelio") {
        name = "Marvin";
      } else {
        name = "Rogelio";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (value) {
      if (changesEnabled) {
        _changeName();
        if (progressValue == 1.0) {
          progressValue = 0;
        }
        progressValue += .05;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
