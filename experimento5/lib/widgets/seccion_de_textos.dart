import 'package:flutter/material.dart';

class SeccionDeTextos extends StatelessWidget {
  const SeccionDeTextos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Galería de imágenes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Creado hace 2 días',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
