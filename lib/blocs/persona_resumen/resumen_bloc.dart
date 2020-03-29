import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecoop_web/blocs/persona_resumen/resumen.dart';
import 'package:ecoop_web/repository/repository.dart';

class ResumenBloc extends Bloc<ResumenEvent, ResumenState> {
  final PersonasRepository _ecoopRepository;

  ResumenBloc({@required PersonasRepository ecoopRepository})
      : assert(ecoopRepository != null),
        _ecoopRepository = ecoopRepository;

  @override
  ResumenState get initialState => ResumenNotLoaded();

  @override
  Stream<ResumenState> mapEventToState(ResumenEvent event) async* {
    if (event is LoadResumen) {
      yield* _mapLoadResumenToState(event);
    } 
  }

  Stream<ResumenState> _mapLoadResumenToState(LoadResumen event) async* {
    yield ResumenLoading();
    final personas = await _ecoopRepository.getPersona(event.personaId);
    yield ResumenLoaded(personas);
  }

}