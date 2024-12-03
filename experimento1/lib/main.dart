// Importación del paquete de Flutter para utilizar widgets de Material Design
import 'package:flutter/material.dart';

// Función principal que es el punto de entrada de la aplicación Flutter
// Ejecuta la aplicación iniciando el widget raíz MyApp
void main() {
  runApp(const MyApp());
}

// Clase que define el widget raíz de la aplicación
// Es un StatelessWidget porque la configuración básica de la app no cambia
class MyApp extends StatelessWidget {
  // Constructor const para optimización de rendimiento
  // El parámetro key se usa para identificar widgets de manera única
  const MyApp({super.key});

  // Método build que define cómo se construye y se ve la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación (usado para identificación del sistema)
      title: 'Flutter Demo',

      // Configuración del tema de la aplicación
      theme: ThemeData(
        // Genera un esquema de colores basado en un color semilla (deepPurple)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        // Activa el diseño de Material Design 3 (última versión)
        useMaterial3: true,
      ),

      // Pantalla principal de la aplicación
      home: const MyHomePage(title: 'Aumentar | Disminuir'),
    );
  }
}

// Widget con estado que representa la página principal de la aplicación
// Hereda de StatefulWidget para permitir cambios dinámicos en la interfaz
class MyHomePage extends StatefulWidget {
  // Constructor que requiere un título
  // El parámetro key se pasa al constructor padre
  const MyHomePage({super.key, required this.title});

  // Propiedad final que almacena el título de la página
  final String title;

  // Método que crea y devuelve el estado mutable de este widget
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Clase de estado correspondiente a MyHomePage
// Maneja la lógica y el estado mutable de la página
class _MyHomePageState extends State<MyHomePage> {
  // Variable de estado que almacena el conteo de pulsaciones
  // El guión bajo (_) indica que es privada dentro de este archivo
  int _counter = 0;

  // Método para incrementar el contador
  // Usa setState para notificar a Flutter que el estado ha cambiado
  void _incrementCounter() {
    setState(() {
      // Incrementa el contador y solicita una reconstrucción de la UI
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  // Método build que construye la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura básica de una pantalla de Material Design
    return Scaffold(
      // Barra de aplicación en la parte superior
      appBar: AppBar(
        //Fondo negro
        backgroundColor: const Color(0xFF030712),
        foregroundColor: const Color(0xFFf3f4f6),
        //Centrando el título
        centerTitle: true,
        // Color de fondo tomado del esquema de colores del tema
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        // Título de la barra de aplicación tomado de la propiedad del widget
        title: Text(widget.title),
      ),

      // Cuerpo de la aplicación
      body: Center(
        // Columna para organizar los widgets verticalmente
        child: Column(
          // Alinea los elementos al centro del eje principal (vertical)
          mainAxisAlignment: MainAxisAlignment.center,

          // Lista de widgets hijos
          children: <Widget>[
            // Texto estático que explica la funcionalidad
            const Text(
              'Valor actual del contador:',
            ),

            // Texto dinámico que muestra el valor del contador
            Text(
              // Convierte el contador a cadena para mostrarlo
              '$_counter',
              // Estilo de texto tomado del tema actual
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            //Espacio entre el texto y los botones
            const SizedBox(height: 30),

            //Fila para los botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Aumentar',
                  child: const Icon(Icons.add),
                ),

                //Espacio entre los botones
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Disminuir',
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
