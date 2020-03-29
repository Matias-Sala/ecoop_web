import 'package:ecoop_web/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonaItem extends StatelessWidget {
  final Persona persona;
  final GestureTapCallback onTap;

  PersonaItem({this.persona, this.onTap});

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
              " Borrar",
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
    return Dismissible(
          key: Key(persona.id.toString()),
          child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.flaticon.com/icons/svg/437/437563.svg'),
                ),
                title: Text(persona.nombre),
                trailing: Icon(Icons.keyboard_arrow_right),
                subtitle: Text(persona.apellido),
                onTap: onTap,
              )),
          background: slideRightBackground(),
        );
  }
}
