import 'package:flutter/material.dart';
import 'package:todomobile/components/button.widget.dart';
import 'package:todomobile/views/home.view.dart';
import 'package:todomobile/widgets/user-card.widget.dart';

class CreateTodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Tarefa",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "04/04/2021",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Alterar data",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 5.0,
                bottom: 10.0,
              ),
              child: TDButton(
                text: "Salvar",
                width: double.infinity,
                callback: () {},
              ),
            ),
            TextButton(
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
