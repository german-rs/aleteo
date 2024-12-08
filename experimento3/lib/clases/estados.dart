import 'dart:developer';

import 'package:flutter/material.dart';

class Estados extends StatefulWidget {
  const Estados({super.key});

  @override
  State<Estados> createState() => _EstadosState();
}

class _EstadosState extends State<Estados> {
  int contador = 0;

  @override
  void initState() {
    log("initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build()");
    log("Contador: $contador");
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text("Contador: $contador"),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          contador++;
                        });
                      },
                      child: const Text("Aumentar")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          contador--;
                        });
                      },
                      child: const Text("Disminuir"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
