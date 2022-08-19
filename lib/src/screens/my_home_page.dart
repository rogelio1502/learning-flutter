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
      body: ListView.builder(
        itemBuilder: (context, index) {
          String general_url = 'https://picsum.photos/id/$index/';
          String url = "${general_url}400/300";

          return InkWell(
            child: Hero(
              tag: general_url,
              child: Card(
                child: FadeInImage(
                  image: NetworkImage(url),
                  placeholder: AssetImage('assets/loading.gif'),
                  height: 300,
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/hero', arguments: general_url);
            },
          );
        },
        itemCount: 50,
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

  void _showDialog(BuildContext context, [int type = 1]) {
    if (type == 2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert Dialog'),
            content: Text('¿Deseas borrar el elemento?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Si')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Acciones'),
            titlePadding: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
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
