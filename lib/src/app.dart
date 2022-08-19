import 'package:flutter/material.dart';
import 'package:my_app/src/screens/hero_screen.dart';
import 'package:my_app/src/screens/my_home_page.dart';

import 'package:my_app/src/screens/second_page.dart';

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
        '/second': (context) => const SecondPage(),
        '/hero': (context) => const HeroScreen(),
      },
    );
  }
}
