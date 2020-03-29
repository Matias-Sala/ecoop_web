import 'dart:async';

import 'models/models.dart';


abstract class PersonasRepository {
  Future<void> addNewPersona(Persona persona);

  Future<void> deletePersona(Persona persona);

  Future<Persona> getPersona(int personaId);

  Future<List<Persona>> getPersonas();

  Future<void> updatePersona(Persona persona);
}