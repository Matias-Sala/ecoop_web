import 'package:ecoop_web/widgets/persona_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ecoop/ecoop.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcoopBloc, EcoopState>(
      builder: (context, state) {
        if (state is PersonasNotLoaded) {
          BlocProvider.of<EcoopBloc>(context).add(LoadPersonas());
        }
        if (state is PersonasLoaded) {
          return ListView.builder(
            itemCount: state.personas.length,
            itemBuilder: (context, index) {
              return PersonaItem(persona: state.personas[index]);
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
