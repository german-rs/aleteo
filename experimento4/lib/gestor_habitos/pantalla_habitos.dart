import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pantalla_nuevo_habito.dart';
import 'habito.dart';

class PantallaHabitos extends StatefulWidget {
  const PantallaHabitos({super.key});

  @override
  State<PantallaHabitos> createState() => _PantallaHabitosState();
}

class _PantallaHabitosState extends State<PantallaHabitos> {
  final List<Habito> habitos = [];
  late final SharedPreferences preferencias;
  String? accion;

  @override
  void initState() {
    super.initState();
    iniciarPreferencias();
  }

  iniciarPreferencias() async {
    preferencias = await SharedPreferences.getInstance();
    obtenerDatos();
  }

  guardarDatos() async {
    await preferencias.setString('test', 'Guardado');
    obtenerDatos();
  }

  obtenerDatos() {
    setState(() {
      accion = preferencias.getString('test') ?? "Sin datos";
    });
    log(accion!);
  }

  void _agregarHabito(String nombre, String descripcion) {
    setState(() {
      habitos.add(
        Habito(
          nombre: nombre,
          descripcion: descripcion,
        ),
      );
    });
  }

  void cambiarEstado(int indice) {
    setState(() {
      habitos[indice].completado = !habitos[indice].completado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestor de hábitos ($accion)"),
      ),
      body: ListView.builder(
        itemCount: habitos.length,
        itemBuilder: (context, indice) {
          String nombre = habitos[indice].nombre;
          String descripcion = habitos[indice].descripcion;
          bool completado = habitos[indice].completado;

          return ListTile(
            onTap: () {
              cambiarEstado(indice);
            },
            title: Text(nombre),
            subtitle: Text(descripcion),
            trailing: completado
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : const Icon(Icons.circle_outlined),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "floating-1",
            onPressed: () {
              guardarDatos();
            },
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "floating-2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PantallaNuevoHabito(
                    enviarHabito: _agregarHabito,
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
