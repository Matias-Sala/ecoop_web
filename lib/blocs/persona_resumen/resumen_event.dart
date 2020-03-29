import 'package:ecoop_web/repository/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ResumenEvent extends Equatable {
  const ResumenEvent();

  @override
  List<Object> get props => [];
}

class LoadResumen extends ResumenEvent {
  final int personaId;

  const LoadResumen(this.personaId);

  @override
  List<Object> get props => [personaId];

  @override
  String toString() => 'LoadDetalles { PersonaId: $personaId }';
}


class UpdatePersona extends ResumenEvent {
  final Persona updatedPersona;

  const UpdatePersona(this.updatedPersona);

  @override
  List<Object> get props => [updatedPersona];

  @override
  String toString() => 'UpdatePersona { updatedPersona: $updatedPersona }';
}



