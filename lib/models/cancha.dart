class Cancha {
  int id;
  String nombre;

  Cancha(
    this.id,
    this.nombre,
  );

  Cancha.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
      };
}
