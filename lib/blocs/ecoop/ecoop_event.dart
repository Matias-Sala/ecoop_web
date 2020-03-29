import 'package:ecoop_web/repository/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class EcoopEvent extends Equatable {
  const EcoopEvent();

  @override
  List<Object> get props => [];
}

class AddPersona extends EcoopEvent {
  final Persona addedPersona;

  const AddPersona(this.addedPersona);

  @override
  List<Object> get props => [addedPersona];

  @override
  String toString() => 'AddPersona { addedPersona: $addedPersona }';
}


class LoadPersonas extends EcoopEvent {}

class DeletePersona extends EcoopEvent {
  final Persona persona;

  const DeletePersona(this.persona);

  @override
  List<Object> get props => [persona];

  @override
  String toString() => 'DeletePersona { Persona: $persona }';
}