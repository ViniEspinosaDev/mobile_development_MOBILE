import 'package:todomobile/models/todo-item.model.dart';

class TodoRepository {
  Future<List<TodoItem>> getTodayTodos() async {
    List<TodoItem> todos = [];
    todos.add(
      new TodoItem(
        id: "1",
        title: "Hoje",
        done: false,
        date: DateTime.now(),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    return todos;
  }

  Future<List<TodoItem>> getTomorrowTodos() async {
    List<TodoItem> todos = [];
    todos.add(
      new TodoItem(
        id: "2",
        title: "Amanhã",
        done: false,
        date: DateTime.now(),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    return todos;
  }

  Future<List<TodoItem>> getAllTodos() async {
    List<TodoItem> todos = [];
    todos.add(
      new TodoItem(
        id: "1",
        title: "Hoje",
        done: false,
        date: DateTime.now(),
      ),
    );
    todos.add(
      new TodoItem(
        id: "2",
        title: "Amanhã",
        done: false,
        date: DateTime.now(),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    return todos;
  }

  Future<TodoItem> add(TodoItem item) async {}
  Future<TodoItem> markAsDone() async {}
}
