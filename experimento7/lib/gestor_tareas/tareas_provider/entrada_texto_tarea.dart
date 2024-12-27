import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gestor_tareas_proveedor.dart';

class EntradaTextoTarea extends StatelessWidget {
  final TextEditingController _ctrl = TextEditingController();

  EntradaTextoTarea({super.key});

  anadirTarea(BuildContext context) {
    final proveedorDeTareas =
        Provider.of<GestorTareasProveedor>(context, listen: false);
    if (_ctrl.text.isNotEmpty) {
      proveedorDeTareas.anadirTarea(_ctrl.text);
      _ctrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _ctrl,
            decoration: const InputDecoration(
              labelText: "Nueva tarea",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => anadirTarea(context),
          child: const Text("Agregar"),
        ),
      ],
    );
  }
}
