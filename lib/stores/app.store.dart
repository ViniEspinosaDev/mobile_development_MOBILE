import 'package:todomobile/models/todo-item.model.dart';

class AppStore {
  String currentState = "none";
  bool busy = false;
  List<TodoItem> todos = [];

  void changeSelected(String state) {
    currentState = state;
  }

  void add(TodoItem item) {
    todos.add(item);
  }

  void setTodos(List<TodoItem> items) {
    todos.addAll(items);
  }

  void clearTodos() {
    todos = [];
  }
}
