import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/controllers/todo.controller.dart';
import 'package:todomobile/stores/app.store.dart';
import 'package:todomobile/widgets/busy.widget.dart';

class TodoList extends StatelessWidget {
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    return Observer(
      builder: (_) => TDBusy(
        busy: store.busy,
        child: store.todos.length == 0
            ? Center(
                child: Text("Nenhuma tarefa encontrada."),
              )
            : ListView.builder(
                padding: EdgeInsets.only(
                  left: 40,
                ),
                itemCount: store.todos.length,
                itemBuilder: (context, index) {
                  var todo = store.todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                          fontSize: 18,
                          color: todo.done
                              ? Colors.black.withOpacity(0.2)
                              : Colors.black),
                    ),
                    subtitle: Text(
                      _dateFormat.format(todo.date),
                    ),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Concluir a Tarefa"),
                            content:
                                Text("Deseja concluir a tarefa ${todo.title}?"),
                            actions: [
                              TextButton(
                                child: new Text("Cancelar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: new Text(
                                  "Concluir",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                                onPressed: () {
                                  controller.markAsDone(todo).then((data) {
                                    Navigator.of(context).pop();
                                  }).catchError((err) {
                                    var snackBar = new SnackBar(
                                      content: Text("Ops, algo deu errado."),
                                    );
                                    ScaffoldMessengerState()
                                        .showSnackBar(snackBar);
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
