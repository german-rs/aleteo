import 'package:flutter/material.dart';
import 'tareas.dart';

class GestorTareasProveedor extends ChangeNotifier {
  final List<Tareas> _tareas = [];

  List<Tareas> get tareas => _tareas; // Añadir getter

  anadirTarea(String titulo) {
    _tareas.add(Tareas(title: titulo));
    notifyListeners();
  }

  actualizarEstado(int indice) {
    _tareas[indice].isComplete = !_tareas[indice].isComplete;
    notifyListeners();
  }
}
