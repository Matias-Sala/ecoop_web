import 'package:ecoop_web/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:ecoop_web/blocs/search/search.dart';
import 'package:ecoop_web/repository/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonasSearchBloc
    extends Bloc<PersonasSearchEvent, PersonasSearchState> {
  final PersonasRepository ecoopRepository;
  List<String> suggestion = List<String>();

  PersonasSearchBloc({@required this.ecoopRepository});

  @override
  PersonasSearchState get initialState => PersonasSearchState.initial();

  @override
  void onTransition(
      Transition<PersonasSearchEvent, PersonasSearchState> transition) {
    print(transition.toString());
  }

  @override
  Stream<PersonasSearchState> mapEventToState(
      PersonasSearchEvent event) async* {
    if (event is GetPersonasEvent) {
      yield PersonasSearchState.loading();

      try {
        if (event.query.trim() != '' && !suggestion.any((s) => s.trim().toLowerCase() == event.query.trim().toLowerCase())){
          suggestion.add(event.query);
        }        
        List<Persona> cities = await _getSearchResults(event.query);
        yield PersonasSearchState.success(cities);
      } catch (_) {
        yield PersonasSearchState.error();
      }
    } else if (event is GetSuggestionEvent) {
      yield PersonasSearchState.suggestion(suggestion);
    }
  }

  Future<List<Persona>> _getSearchResults(String query) async {
    final personas = await ecoopRepository.getPersonas();
    return personas
        .where((persona) => (persona.nombre.trim() + persona.apellido.trim())
            .toLowerCase()
            .contains(query))
        .toList();
  }
}
