import 'package:experimento4/audio_player/reproductor_musica.dart';
import 'package:experimento4/entradas_de_datos/in_datos.dart';
import 'package:experimento4/galeria_imagenes/galeria_imagenes.dart';
import 'package:experimento4/gestor_habitos/home_habitos.dart';
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeHabitosPage()));
                },
                child: const Text('Gestor de hábitos')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InDatos()));
                },
                child: const Text('Widget de entrada de datos')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GaleriaImagenesPage()));
                },
                child: const Text('Galería de imágenes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReproductorMusica()));
                },
                child: const Text('Reproductor de audio')),
            ElevatedButton(
                onPressed: () {}, child: const Text('Todo - Provider')),
            ElevatedButton(onPressed: () {}, child: const Text('Todo - Block')),
          ],
        ),
      ),
    );
  }
}
