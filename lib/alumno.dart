import 'modulo.dart';

class Alumno {
  String nombre;
  String apellidos;
  String dni;
  int edad;
  bool repetidor;
  List<Modulo> modulos = [];

  Alumno(
    this.nombre,
    this.apellidos,
    this.dni,
    this.edad,
    this.repetidor,
    this.modulos,
  );

  @override
  String toString() {
    return 'Nombre y apellidos: $nombre $apellidos\n'
        'DNI: $dni\n'
        'Edad: $edad\n'
        'Modulos: $modulos\n'
        'Repetidor: $repetidor\n';
       
  }
}
