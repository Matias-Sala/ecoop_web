import 'package:ecoop_web/repository/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class EcoopEvent extends Equatable {
  const EcoopEvent();

  @override
  List<Object> get props => [];
}

class LoadPersonas extends EcoopEvent {}

class AddPersona extends EcoopEvent {
  final Persona persona;

  const AddPersona(this.persona);

  @override
  List<Object> get props => [persona];

  @override
  String toString() => 'AddPersona { Persona: $Persona }';
}

class UpdatePersona extends EcoopEvent {
  final Persona updatedPersona;

  const UpdatePersona(this.updatedPersona);

  @override
  List<Object> get props => [updatedPersona];

  @override
  String toString() => 'UpdatePersona { updatedPersona: $updatedPersona }';
}

class DeletePersona extends EcoopEvent {
  final Persona persona;

  const DeletePersona(this.persona);

  @override
  List<Object> get props => [persona];

  @override
  String toString() => 'DeletePersona { Persona: $persona }';
}

class ClearCompleted extends EcoopEvent {}

class ToggleAll extends EcoopEvent {}

class PersonaUpdated extends EcoopEvent {
  final List<Persona> personas;

  const PersonaUpdated(this.personas);

  @override
  List<Object> get props => [personas];
}