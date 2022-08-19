import 'package:flutter/material.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String general_url = ModalRoute.of(context)?.settings.arguments as String;
    String url = "${general_url}400/400";
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Screen')),
      body: Column(
        children: [
          Hero(
            tag: general_url,
            child: Card(
              child: FadeInImage(
                  image: NetworkImage(url),
                  placeholder: const AssetImage('assets/loading.gif')),
            ),
          ),
        ],
      ),
    );
  }
}
