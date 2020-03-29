import 'package:equatable/equatable.dart';
import 'package:ecoop_web/repository/models/models.dart';

abstract class ResumenState extends Equatable {
  const ResumenState();

  @override
  List<Object> get props => [];
}

class ResumenLoading extends ResumenState {}

class ResumenLoaded extends ResumenState {
  final Persona persona;

  const ResumenLoaded([this.persona = const Persona(0, '', '', null)]);

  @override
  List<Object> get props => [persona];

  @override
  String toString() => 'ResumenLoaded { persona: $persona }';
}

class ResumenNotLoaded extends ResumenState {}