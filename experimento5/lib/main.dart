import '/widgets/galeria_imagenes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/galeria_imagenes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GaleriaImagenesProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: GaleriaImagenes(),
    );
  }
}
