import 'package:ecoop_web/blocs/persona_resumen/resumen.dart';
import 'package:ecoop_web/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PersonaResumen extends StatelessWidget {
  final int personaId;
  final PersonasRepository repository = PersonasApiRepository();

  PersonaResumen({Key key, @required this.personaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: BlocProvider(
          create: (context) => ResumenBloc(ecoopRepository: repository),
          child: BlocBuilder<ResumenBloc, ResumenState>(
            builder: (context, state) {
              if (state is ResumenNotLoaded) {
                BlocProvider.of<ResumenBloc>(context)
                    .add(LoadResumen(this.personaId));
              }
              if (state is ResumenLoaded) {
                return TabBarView(
                  children: [
                    Text(state.persona.nombre),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
