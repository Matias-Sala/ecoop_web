import 'dart:async';

import 'models/models.dart';


abstract class PersonasRepository {
  Future<void> addNewPersona(Persona persona);

  Future<void> deletePersona(Persona persona);

  Future<List<Persona>> personas();

  Future<void> updatePersona(Persona persona);
}