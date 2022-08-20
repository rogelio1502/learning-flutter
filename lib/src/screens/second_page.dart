import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    SecondPageArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SecondPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Media interaction"),
          ),
          OutlinedButton(
            onPressed: () => _getImage(ImageSource.gallery),
            child: const Text('Get from galleryy'),
          ),
          OutlinedButton(
            onPressed: () => _getImage(ImageSource.camera),
            child: const Text('Pick a picture'),
          ),
          OutlinedButton(
            onPressed: () => _showAlert(context),
            child: const Text('Upload Photo'),
          ),
          Center(
            child: getImageWidget(),
          )
        ],
      ),
    );
  }

  File? image;

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Selecciona una opción"),
            actions: [
              ListTile(
                title: const Text('Camera'),
                leading: const Icon(Icons.camera),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                leading: const Icon(Icons.browse_gallery),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          );
        });
  }

  void _getImage(ImageSource source) async {
    try {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      setState(() {
        print(image);
        if (pickedFile != null) {
          image = File(pickedFile.path);
          // print(image!.path.toString());
        }
      });
    } catch (e) {}
  }

  Widget getImageWidget() {
    if (image != null) {
      return Image.file(
        image!,
        height: 300,
        width: 200,
      );
    } else {
      return const Text('Selecciona una imagen');
    }
  }
}

class SecondPageArguments {
  String name;
  String lastName;
  String title;
  SecondPageArguments(
      {this.name = '', this.lastName = '', required this.title});
}
