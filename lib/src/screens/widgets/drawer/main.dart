import 'package:flutter/material.dart';

import '../../second_page.dart';

Widget mainDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Rogelio Torres"),
          accountEmail: Text("rogelio@gmail.com"),
        ),
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(children: const [
            FlutterLogo(
              size: 100,
            ),
            Text(
              'My App',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ]),
        ),
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () => _goHome(context),
        ),
        ListTile(
          title: const Text('Second Page'),
          leading: const Icon(Icons.home),
          onTap: () => _goSecondPage(context),
        ),
      ],
    ),
  );
}

void _goHome(BuildContext context) {
  Navigator.pop(context);
}

void _goSecondPage(BuildContext context) {
  Navigator.of(context).pushNamed(
    '/second',
    arguments: SecondPageArguments(title: 'Media'),
  );
}
