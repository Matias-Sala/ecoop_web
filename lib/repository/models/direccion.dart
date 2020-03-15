import 'package:equatable/equatable.dart';

class Direccion extends Equatable {
  final String calle;
  final String numero;
  final Direccion depto;

  const Direccion({this.calle, this.numero, this.depto});

  @override
  List<Object> get props => [calle, numero, depto];

  static Direccion fromJson(dynamic json) {
    return Direccion(
      calle: json['calle'],
      numero: json['numero'],
      depto: json['depto'],
    );
  }

  @override
  String toString() => 'Direccion { direccion: $calle $numero $depto }';
}