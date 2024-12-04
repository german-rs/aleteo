import 'dart:io';

void main() {
  stdout.write('Ingresa una opción: ');
  int opcion = int.parse(stdin.readLineSync()!);
  print(opcion);

  stdout.write('Ingrese el primer número: ');
  int primerNumero = int.parse(stdin.readLineSync()!);

  stdout.write('Ingrese el primer número: ');
  int segundoNumero = int.parse(stdin.readLineSync()!);

  switch (opcion) {
    case 1:
      print(sumar(primerNumero, segundoNumero));
      break;
    case 2:
      print(restar(primerNumero, segundoNumero));
      break;
    case 3:
      print(multiplicar(primerNumero, segundoNumero));
      break;
    case 4:
      print(dividir(primerNumero, segundoNumero));
      break;
    default:
      print('Ingrese un número entre 1 y 4');
  }
}

int sumar(int a, int b) => a + b;

int restar(int a, int b) => a - b;

int multiplicar(int a, int b) => a * b;

dynamic dividir(int a, int b) {
  if (b == 0) {
    return 'No se puede dividir por 0';
  }
  return a / b;
}
