import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/components/button.widget.dart';
import 'package:todomobile/controllers/todo.controller.dart';
import 'package:todomobile/models/todo-item.model.dart';
import 'package:todomobile/stores/app.store.dart';
import 'package:todomobile/views/home.view.dart';
import 'package:todomobile/widgets/user-card.widget.dart';

class CreateTodoView extends StatefulWidget {
  @override
  _CreateTodoViewState createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  String task = "";
  DateTime date = DateTime.now();

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2099),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Título Inválido';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        task = val;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        _dateFormat.format(date),
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
                      onPressed: () {
                        _selectDate(context);
                      },
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
                callback: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  var todo = new TodoItem(
                    title: task,
                    date: date,
                  );

                  controller.add(todo).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  });
                },
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
