import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todomobile/models/todo-item.model.dart';
import 'package:todomobile/user.dart';

class TodoRepository {
  String beginURLAddress = "https://10.0.2.2:5001";

  Future<List<TodoItem>> getTodayTodos() async {
    var url = beginURLAddress + "/v1/todos/undone/today";

    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );

    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getTomorrowTodos() async {
    var url = beginURLAddress + "/v1/todos/undone/tomorrow";

    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );

    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getAllTodos() async {
    var url = beginURLAddress + "/v1/todos/undone/todos";

    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
      ),
    );

    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<TodoItem> add(TodoItem item) async {
    var url = beginURLAddress + "/v1/todos";

    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }

  Future<TodoItem> markAsDone(TodoItem item) async {
    var url = beginURLAddress + "/v1/todos/mark-as-done";

    try {
      Response response = await Dio().put(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
