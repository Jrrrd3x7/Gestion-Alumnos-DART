class Modulo {
  String nombre;
  int cantidadRa;
  int horas;

  Modulo(this.nombre, this.cantidadRa, this.horas);

  @override
  String toString() {
    return 'Nombre del modulo: $nombre, '
        "Cantidad de Ra'S: $cantidadRa, " 
        'Horas: $horas\n ';
  }
}
