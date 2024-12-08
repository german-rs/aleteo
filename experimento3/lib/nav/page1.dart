import 'package:experimento3/nav/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Página 1.'),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Page2(
                          product: 'Papas fritas',
                        )));
          },
          child: const Text("Ir a la página 2")),
    );
  }
}
