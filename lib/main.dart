import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/pages/my_home_page.dart';
import 'package:my_app/pages/second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: MyHomePage(),
      initialRoute: "/",
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const SecondPage()
      },
    );
  }
}
