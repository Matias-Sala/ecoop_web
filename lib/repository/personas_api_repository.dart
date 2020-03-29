import 'dart:async';
// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;

import 'models/models.dart';
import 'personas_repository.dart';


class PersonasApiRepository extends PersonasRepository {
  final _baseUrl = 'https://localhost:5001';

  @override
  Future<void> addNewPersona(Persona persona) {
    // TODO: implement addNewPersona
    throw UnimplementedError();
  }

  @override
  Future<void> deletePersona(Persona persona) {
    // TODO: implement deletePersona
    throw UnimplementedError();
  }

  @override
  Future<Persona> getPersona(int personaId) {
    final persona =Persona(personaId, 'Matias', 'Sala', null);
    return Future.value(persona);
  }

  @override
  Future<List<Persona>> getPersonas() {
    
    final personas = [
      Persona(1, 'Matias', 'Sala', null),
      Persona(2, 'Ivana', 'Dominguez', null),
    ];

    return Future.value(personas);

    // return http.get('$_baseUrl/api/people/PARENT').then((response) {
    //   var jsonResponse = convert.jsonDecode(response.body);
    //   var personas = List<Persona>();
    //   for (int i = 0; i < jsonResponse.length; i++) {
    //     personas.add(Persona.fromJson(jsonResponse[i]));
    //   }
    //   return personas;
    // });

    // if (response.statusCode == 200) {
    //   var jsonResponse = convert.jsonDecode(response.body);
    //   var personas = List<Persona>();
    //   for (int i = 0; i < jsonResponse.length; i++) {
    //     personas.add(Persona.fromJson(jsonResponse[i]));
    //   }
    //   return personas;
    // } else {
    //   throw ('Request failed with status: ${response.statusCode}.');
    // }
  }

  @override
  Future<void> updatePersona(Persona persona) {
    // TODO: implement updatePersona
    throw UnimplementedError();
  }
}
