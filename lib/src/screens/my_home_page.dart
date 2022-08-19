import 'package:flutter/material.dart';
import 'package:my_app/src/screens/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(children: [
              const Center(
                child: Text('Hola mundo'),
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () => _showSnackBar(context),
                  child: const Text('Mostrar Snackbar'),
                ),
              ),
              Center(
                  child: OutlinedButton(
                child: const Text('Mostrar Simple Dialog'),
                onPressed: () => _showDialog(context),
              )),
            ]),
          );
        },
      ),
      drawer: _getDrawer(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
    );
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
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Acciones'),
          titlePadding: const EdgeInsets.all(30),
          children: [
            ListTile(
              title: const Text('Editar'),
              leading: const Icon(Icons.save),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Eliminar'),
              leading: const Icon(Icons.delete),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Cancelar'),
              leading: const Icon(Icons.cancel),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
      barrierDismissible: false, // works to disable back tap hide
    );
  }

  void _showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: const Text('Show Snackbar'),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'Cancelar',
        onPressed: () {
          print("Cancelar");
        },
      ),
    );
    // _scaffoldKey.currentState?.showSnackBar(snackBar);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _getDrawer(BuildContext context) {
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
      arguments: SecondPageArguments(
        name: "Rgoelio",
        lastName: "Pasillas",
      ),
    );
  }
}
