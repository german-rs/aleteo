void main() {
  // print("Hola mundo");

  // variables();
  // print(variables2());
  //listasYmapa();
  // operadores();
  //control();

  //El segundo parámetro es opcional.
  // saludar('Germán', 'Riveros');
  // saludar2(nombre: 'Andrés');

  //Se puede cambiar el orden.
  // saludar3(apellido: 'apellido1', nombre: 'nombre1');
  // Student estudiante = Student(name: 'nombre2', id: 2);
  // print(estudiante.name);
  clima();
}

Future<void> clima() async {
  print("Obteniendo el clima...");
  await Future.delayed(const Duration(seconds: 3));
  print("El clima actual es de 29 grados");
}

// Future<String> obtenerClima() async {
//   String datosClima = await clima();
//   return await clima();
// }

class Student {
  final int id;
  final String name;

  Student({required this.name, required this.id});

  String toString() {
    return 'nombre $name ($id)';
  }
}

class Animal {
  void sonido() => print('Hacer un sonido');
}

class Perro extends Animal {
  void sonido() => print('Ladrar');
}

void variables() {
  var ciudad = 'Cucao';
  var temp = 38.0;
  int edad = 90;
  double altura = 75.11;
  bool esEstudiante = true;
  String nombre = "Germán";
  print(ciudad);
  print(temp);
  print(edad);
  print(altura);
  print(esEstudiante);
  print(nombre);
}

//Retorno.
String variables2() {
  var ciudad = 'Quellón';
  return ciudad;
}

void listasYmapa() {
  List<String> comidas = ['Papas fritas', 'Arroz', 'Lentejas'];
  Map<String, int> estudiantes = {
    "Loreto": 1,
    "Rodrigo": 2,
    "Germán": 3,
  };
  estudiantes.forEach((nombre, edad) => print('$nombre tiene $edad años.'));

//Distintos tipos de datos con dynamic
  Map<String, dynamic> productos = {
    "Loreto": [],
    "Rodrigo": "Hola",
    "Germán": 3,
  };
}

void operadores() {
  int a = 1;
  int b = 12;
  //Aritméticos
  print(a + b);
  print(a - b);
  print(a / b);
  print(a * b);
  print(a % b);

  //Condicionales
  print(a < b);
  print(a > b);
  print(a >= b);
  print(a == b);
  print(a != b);
}

void control() {
  int edad = 18;
  if (edad > 18) {
    print('Mayor de edad');
  } else {
    print('Menor de edad');
  }

  String diaSemana = 'Lunes';
  switch (diaSemana) {
    case 'Lunes':
      print('Es dia lunes');
      break;
    case 'Martes':
      print('Es dia martes');
      break;
    default:
      print('Otro día');
  }

  //Bucles.
  for (int i = 0; i < 5; i++) {
    print('número: $i');
  }

  for (var element in [1, 2, 3, 4]) {
    print('elemento: $element');
  }

  int count = 1;
  while (count < 5) {
    print('Contador: $count');
    count++;
  }
}

//Nombre es obligatorio. Parámetros posicionales.
void saludar(String nombre, [String apellido = '']) {
  print('Hola $nombre $apellido');
}

//Solo el nombre es requerido u obligatorio. Parámetros nombrados.
void saludar2({required String nombre, String apellido = ''}) {
  print('Hola $nombre $apellido');
}

//Ambas son requeridos.
void saludar3({required String nombre, required String apellido}) {
  print('Hola $nombre $apellido');
}
