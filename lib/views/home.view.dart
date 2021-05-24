import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomobile/controllers/todo.controller.dart';
import 'package:todomobile/stores/app.store.dart';
import 'package:todomobile/views/create-todo.view.dart';
import 'package:todomobile/widgets/navbar.widget.dart';
import 'package:todomobile/widgets/todo-list.widget.dart';
import 'package:todomobile/widgets/user-card.widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    // Ao rodar o app
    if (store.currentState == "none") {
      controller.changeSelection("today");
    }

    return Scaffold(
        body: Column(
          children: <Widget>[
            UserCard(),
            Navbar(),
            Expanded(
              child: Container(
                child: TodoList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTodoView(),
              ),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}
