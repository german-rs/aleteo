import 'package:experimento3/clases/estados.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String product;
  const Page2({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Producto $product'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Volver")),
          const Expanded(child: Estados())
        ],
      ),
    );
  }
}
