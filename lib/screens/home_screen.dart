import 'package:ecoop_web/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecoop_web/blocs/blocs.dart';
import 'package:ecoop_web/blocs/ecoop/ecoop_bloc.dart';
import 'package:ecoop_web/widgets/persona_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coop. Almafuerte'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        BlocProvider.of<PersonasSearchBloc>(context)));
              })
        ],
      ),
      body: BlocProvider(
        create: (context) => BlocProvider.of<EcoopBloc>(context),
        child: BlocBuilder<EcoopBloc, EcoopState>(
          builder: (context, state) {
            if (state is PersonasNotLoaded) {
              BlocProvider.of<EcoopBloc>(context).add(LoadPersonas());
            }
            if (state is PersonasLoaded) {
              return ListView.builder(
                itemCount: state.personas.length,
                itemBuilder: (context, index) {
                  return PersonaItem(
                    persona: state.personas[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonaResumen(personaId: state.personas[index].id,)),
                      );
                    },
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final PersonasSearchBloc personasSearchBloc;

  DataSearch(this.personasSearchBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    personasSearchBloc.add(GetPersonasEvent(query));

    return BlocBuilder(
      bloc: personasSearchBloc,
      builder: (BuildContext context, PersonasSearchState state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return Container(
            child: Text('Error'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return PersonaItem(
              persona: state.personas[index],
              onTap: () => close(context, state.personas[index].id.toString()),
            );
          },
          itemCount: state.personas.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //personasSearchBloc.add(GetSuggestionEvent());

    return BlocBuilder(
      bloc: personasSearchBloc,
      builder: (BuildContext context, PersonasSearchState state) {
        // if (state.suggestion != null) {
        //   return ListView.builder(
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         leading: Icon(Icons.history),
        //         title: Text(state.suggestion[index]),
        //         onTap: () {query = state.suggestion[index];},
        //       );
        //     },
        //     itemCount: state.suggestion.length,
        //   );
        // }
        return Column();
      },
    );
  }
}
