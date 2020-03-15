import 'package:equatable/equatable.dart';

abstract class PersonasSearchEvent extends Equatable {
  const PersonasSearchEvent();

  @override
  List<Object> get props => [];
}

class GetPersonasEvent extends PersonasSearchEvent {
  final String query;

  const GetPersonasEvent(this.query);

  @override
  String toString() => 'GetPersonasSearchEvent { query: $query }';
}

class GetSuggestionEvent extends PersonasSearchEvent {
  const GetSuggestionEvent();

  @override
  String toString() => 'GetSuggestionEvent';
}