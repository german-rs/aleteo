import 'package:flutter/material.dart';

class PantallaNuevoHabito extends StatefulWidget {
  final Function(String, String) enviarHabito;

  const PantallaNuevoHabito({super.key, required this.enviarHabito});

  @override
  State<PantallaNuevoHabito> createState() => _PantallaNuevoHabitoState();
}

class _PantallaNuevoHabitoState extends State<PantallaNuevoHabito> {
  final TextEditingController _controlNombre = TextEditingController();
  final TextEditingController _controlDescripcion = TextEditingController();

  void enviar() {
    final nombre = _controlNombre.text;
    final descripcion = _controlDescripcion.text;

    if (nombre.isNotEmpty && descripcion.isNotEmpty) {
      widget.enviarHabito(nombre, descripcion);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo hábito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controlNombre,
              decoration: const InputDecoration(
                labelText: "Nombre del hábito",
              ),
            ),
            TextField(
              controller: _controlDescripcion,
              decoration: const InputDecoration(
                labelText: "Descripción",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: enviar,
              child: const Text("Agregar"),
            ),
          ],
        ),
      ),
    );
  }
}
