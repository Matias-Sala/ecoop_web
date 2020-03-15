import 'package:equatable/equatable.dart';
import 'package:ecoop_web/repository/models/models.dart';

abstract class EcoopState extends Equatable {
  const EcoopState();

  @override
  List<Object> get props => [];
}

class PersonasLoading extends EcoopState {}

class PersonasLoaded extends EcoopState {
  final List<Persona> personas;

  const PersonasLoaded([this.personas = const []]);

  @override
  List<Object> get props => [personas];

  @override
  String toString() => 'PersonasLoaded { personas: $personas }';
}

class PersonasNotLoaded extends EcoopState {}