import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entrada_texto_tarea.dart';
import 'gestor_tareas_proveedor.dart';

class PantallaProveedorTareas extends StatelessWidget {
  const PantallaProveedorTareas({super.key});

  @override
  Widget build(BuildContext context) {
    final gestorTareasProveedor = Provider.of<GestorTareasProveedor>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de tareas"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gestorTareasProveedor.tareas.length, // Usar getter
              itemBuilder: (BuildContext context, int indice) {
                final tarea =
                    gestorTareasProveedor.tareas[indice]; // Usar getter

                return ListTile(
                  title: Text(
                    tarea.title,
                    style: TextStyle(
                      decoration: tarea.isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Checkbox(
                    value: tarea.isComplete,
                    onChanged: (valor) =>
                        gestorTareasProveedor.actualizarEstado(indice),
                  ),
                );
              },
            ),
          ),
          EntradaTextoTarea(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
