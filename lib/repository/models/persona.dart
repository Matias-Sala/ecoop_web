import 'package:equatable/equatable.dart';

import 'models.dart';

class Persona extends Equatable {
  final int id;
  final String nombre;
  final String apellido;
  final Direccion direccion;

  const Persona(this.id, this.nombre, this.apellido, this.direccion);

  @override
  List<Object> get props => [id, nombre, apellido, direccion];

  static Persona fromJson(dynamic json) {
    return Persona(
      json['_id'],
      json['nombre'],
      json['apellido'],
      Direccion.fromJson(json['direccion'])
    );
  }

  @override
  String toString() => 'Persona { id: $id }';
}