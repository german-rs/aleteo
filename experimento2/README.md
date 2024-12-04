# Experimento 02


## Descripción del Código

Este proyecto de Flutter incluye un widget principal que demuestra el uso de `Fluttertoast` para mostrar mensajes toast en la pantalla. A continuación se describen las principales características del código.

### Importaciones de Paquetes
- `flutter/material.dart`: Importa los widgets y temas básicos de Flutter.
- `fluttertoast/fluttertoast.dart`: Importa el paquete `fluttertoast` para mostrar mensajes toast.

### Definición de la Clase `MyWidget`
- `class MyWidget extends StatelessWidget`: Define una clase que extiende `StatelessWidget`.
- `const MyWidget({super.key})`: Constructor constante de la clase `MyWidget`.

### Atributos
- `final String title = 'My Aplication';`: Define un título para la aplicación.

### Método `showCustomToast`
- `void showCustomToast(BuildContext context)`: Método que muestra un mensaje toast utilizando el paquete `fluttertoast`.
- Parámetros de `Fluttertoast.showToast`: Configura el mensaje, duración, gravedad (posición), colores de fondo y texto, y el tamaño de la fuente.

### Método `build`
- `@override Widget build(BuildContext context)`: Sobrescribe el método `build` del `StatelessWidget`.
- `final size = MediaQuery.of(context).size;`: Obtiene el tamaño de la pantalla.
- `final isAndroid = Theme.of(context).platform == TargetPlatform.android;`: Comprueba si la plataforma es Android.

### Estructura del Widget
- `MaterialApp`: Envoltorio principal de la aplicación.
- `Scaffold`: Proporciona la estructura básica de diseño visual.
- `AppBar`: Barra de la aplicación con título, icono de menú y color de fondo personalizados.

### Cuerpo del `Scaffold`
- `Column`: Contiene los widgets organizados verticalmente.
- `Container`: Contenedor para el encabezado y pie de página con estilos.
- `Expanded` y `SizedBox`: Crean un área central expansible utilizando un `Stack`.
- `Positioned`: Posiciona widgets de manera absoluta dentro del `Stack`.
- `FloatingActionButton`: Botones flotantes para mostrar el toast.

### Detalles de Estilo
- Uso de estilos personalizados para texto (`TextStyle`), colores (`Colors`) y familias de fuentes (`fontFamily`).

Este código proporciona una interfaz de usuario estructurada con un encabezado, un área central con botones flotantes y un pie de página. Además, muestra cómo utilizar `Fluttertoast` para mostrar mensajes toast cuando se presionan los botones flotantes.
