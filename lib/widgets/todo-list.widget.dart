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
                  );
                },
              ),
      ),
    );
  }
}
