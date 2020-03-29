import 'package:ecoop_web/blocs/blocs.dart';
import 'package:ecoop_web/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecoop_web/repository/repository.dart';


void main() {
  final PersonasRepository repository = PersonasApiRepository();

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final PersonasRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCoop',
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => EcoopBloc(ecoopRepository: repository),
        ),
        BlocProvider(
          create: (context) => PersonasSearchBloc(ecoopRepository: repository),
        )
      ], child: HomeScreen()),
    );
  }
}
