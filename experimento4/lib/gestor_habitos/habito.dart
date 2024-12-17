class Habito {
  String nombre;
  String descripcion;
  bool completado;

  Habito({
    required this.nombre,
    required this.descripcion,
    this.completado = false,
  });

  @override
  String toString() {
    return "nombre: $nombre, descripción: $descripcion, completado: $completado";
  }
}
