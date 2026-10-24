import 'dart:io';

import 'package:gestion_alumnos/modulo.dart';
import 'package:gestion_alumnos/alumno.dart';

Map<String, Modulo> modulos = {
  'M013': Modulo('Dart', 4, 300),
  'M02': Modulo('Sostenibilidad', 5, 250),
  'M03': Modulo('Proyecto', 6, 250),
  'M01': Modulo('PHP', 7, 140),
  'M04': Modulo('BBDD', 4, 200),
  'M09': Modulo('SGE', 5, 240),
  'M07': Modulo('Lenguaje de marcas', 6, 20),
};
List<Alumno> alumnos = [
  Alumno('Pepe', 'Yamal', '123456789A', 33, true, [
    Modulo('Dart', 4, 300),
    Modulo('Sostenibilidad', 5, 250),
  ]),
  Alumno('Ramon', 'Perez', '987654321B', 22, false, [
    Modulo('PHP', 7, 140),
    Modulo('BBDD', 4, 200),
    Modulo('Proyecto', 6, 250),
    Modulo('SGE', 5, 240),
  ]),
  Alumno('Donald', 'Trump', '232323232C', 80, true, [
    Modulo('Lenguaje de marcas', 6, 20),
    Modulo('Proyecto', 6, 250),
  ]),
  Alumno('Mike', 'Tyson', '676767676B', 60, true, [
    Modulo('SGE', 5, 240),
    Modulo('Proyecto', 6, 250),
  ]),
];

void main() {
  int? menu;
  do {
    print('1 - Consultar Modulo: ');
    print('2 - Ordenar Modulos: ');
    print('3 - Validar Modulo');
    stdout.write('Elige una opcion: ');
    menu = int.parse(stdin.readLineSync()!);
    switch (menu) {
      case 0:
        print('0 - Hasta Luego!');
        break;
      case 1:
        consultarModulo();
        break;
      case 2:
        ordenarModulos();
        break;
      case 3:
        validarModulos();
        break;
      default:
        print('Opcion no disponible');
    }
  } while (menu != 0);
  print('$alumnos');
}

void consultarModulo() {
  stdout.write('Nombre Alumno: ');
  String? nombreAlumno = stdin.readLineSync();
  stdout.write('Nombre modulo: ');
  String nombreModulo = stdin.readLineSync()!;
  for (Alumno a in alumnos) {
    if (a.nombre.toLowerCase() == nombreAlumno?.toLowerCase()) {
      print(buscarModulo(a, nombreModulo));
      return;
    }
  }
  print('Alumno no existe');
}

void ordenarModulos() {
  List<String> numModulo = modulos.keys.toList();
  numModulo.sort((a, b) {
    int numA = int.parse(a.substring(1));
    int numB = int.parse(b.substring(1));
    return numA.compareTo(numB);
  });
  print(numModulo);
}

bool buscarModulo(Alumno alumno, String nombreModulo) {
  for (Modulo buscar in alumno.modulos) {
    if (buscar.nombre.toLowerCase() == nombreModulo.toLowerCase()) {
      return true;
    }
  }
  return false;
}

void validarModulos() {
  stdout.write('Nombre de alumno: ');
  String? nombre = stdin.readLineSync();
  for (Alumno a in alumnos) {
    if (a.nombre.toLowerCase() == nombre?.toLowerCase()) {
      if (a.modulos.length > 4) { 
        print('Curso completo');
      } else {
        print('${a.nombre} tiene ${a.modulos.length} modulos');
        for (Modulo m in modulos.values) {
          if (a.modulos.length >= 4) {
            break;
          }
          if (!buscarModulo(a, m.nombre)) {
            a.modulos.add(m);

            print('Añadido ${m.nombre}');
          }
        }

        print('Modulos de ${a.nombre}: ${a.modulos}');
      }

      return;
    }
  }
  print('El alumno no existe');
}
