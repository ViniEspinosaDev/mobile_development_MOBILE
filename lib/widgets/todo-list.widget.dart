import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: 40,
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            "Ir ao supermercado",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text("04/04/2021"),
        ),
        ListTile(
          title: Text(
            "Consulta médica",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text("04/04/2021"),
        ),
        ListTile(
          title: Text(
            "Buscar encomenda na portaria",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text("04/04/2021"),
        ),
        ListTile(
          title: Text(
            "Enviar trabalho de física",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          subtitle: Text("04/04/2021"),
        ),
      ],
    );
  }
}
