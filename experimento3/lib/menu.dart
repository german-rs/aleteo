import 'package:experimento3/gestor-habitos/home_hab.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeHabitosPage()));
              },
              child: const Text('Gestor de hábitos'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Galeria de imágenes'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Reproductor de audio'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Todo - Provider'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Todo - block'),
            ),
          ],
        ),
      ),
    );
  }
}
