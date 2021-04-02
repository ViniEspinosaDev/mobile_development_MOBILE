import 'package:flutter/material.dart';
import 'package:todomobile/views/create-todo.view.dart';
import 'package:todomobile/widgets/navbar.widget.dart';
import 'package:todomobile/widgets/todo-list.widget.dart';
import 'package:todomobile/widgets/user-card.widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
