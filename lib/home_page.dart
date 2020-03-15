import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ecoop/ecoop.dart';

class HomePage extends StatelessWidget {

  Widget slideRightBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

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
              return Dismissible(
                key: Key(state.personas[index].id),
                child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.flaticon.com/icons/svg/437/437563.svg'),
                      ),
                      title: Text(state.personas[index].nombre),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      subtitle: Text(state.personas[index].apellido),
                      onTap: () {
                        // do something
                      },
                    )),
                background: slideRightBackground(),
              );
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
