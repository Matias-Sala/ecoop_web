import 'package:ecoop_web/repository/models/models.dart';

class PersonasSearchState {
  final bool isLoading;
  final List<Persona> personas;
  final bool hasError;
  final List<String> suggestion;

  const PersonasSearchState({this.isLoading, this.personas, this.hasError, this.suggestion});

  factory PersonasSearchState.initial() {
    return PersonasSearchState(
      personas: [],
      suggestion: [],
      isLoading: false,
      hasError: false,
    );
  }

  factory PersonasSearchState.loading() {
    return PersonasSearchState(
      personas: [],
      isLoading: true,
      hasError: false,
    );
  }

  factory PersonasSearchState.success(List<Persona> personas) {
    return PersonasSearchState(
      personas: personas,
      isLoading: false,
      hasError: false,
    );
  }

  factory PersonasSearchState.error() {
    return PersonasSearchState(
      personas: [],
      isLoading: false,
      hasError: true,
    );
  }

  factory PersonasSearchState.suggestion(List<String> suggestion) {
    return PersonasSearchState(
      suggestion: suggestion,
      isLoading: false,
      hasError: true,
    );
  }

  @override
  String toString() =>
      'PersonasSearchState {personas: ${personas.toString()}, isLoading: $isLoading, hasError: $hasError }';
}