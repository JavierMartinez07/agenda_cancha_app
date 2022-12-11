class Agenda {
  int? id;
  int canchaId;
  String fecha;
  String nombre;
  String apellido;
  String clima;

  Agenda(
    this.id,
    this.canchaId,
    this.fecha,
    this.nombre,
    this.apellido,
    this.clima,
  );

  Agenda.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        canchaId = json['canchaId'],
        fecha = json['fecha'],
        nombre = json['nombre'],
        apellido = json['apellido'],
        clima = json['clima'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'canchaId': canchaId,
        'fecha': fecha,
        'nombre': nombre,
        'apellido': apellido,
        'clima': clima,
      };
}
