import 'dart:async';
import 'package:ecoop_web/blocs/ecoop/ecoop.dart';
import 'package:ecoop_web/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class EcoopBloc extends Bloc<EcoopEvent, EcoopState> {
  final PersonasRepository _ecoopRepository;

  EcoopBloc({@required PersonasRepository ecoopRepository})
      : assert(ecoopRepository != null),
        _ecoopRepository = ecoopRepository;

  @override
  EcoopState get initialState => PersonasNotLoaded();

  @override
  Stream<EcoopState> mapEventToState(EcoopEvent event) async* {
    if (event is LoadPersonas) {
      yield* _mapLoadPersonasToState();
    } else if (event is DeletePersona) {
      yield* _mapDeletePersonaToState(event);
    } else if (event is AddPersona) {
      yield* _mapAddPersonaToState(event);
    } 
  }

  Stream<EcoopState> _mapLoadPersonasToState() async* {
    yield PersonasLoading();
    final personas = await _ecoopRepository.getPersonas();
    yield PersonasLoaded(personas);
  }

  Stream<EcoopState> _mapAddPersonaToState(AddPersona event) async* {
    _ecoopRepository.addNewPersona(event.addedPersona);
  }

  Stream<EcoopState> _mapDeletePersonaToState(DeletePersona event) async* {
    _ecoopRepository.deletePersona(event.persona);
  }

}