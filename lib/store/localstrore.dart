import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/todo_model.dart';

abstract class LocalStrore {
  LocalStrore_();

  static setTodo(TodoModel todo, int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('todo') ?? [];
    String todoJson = jsonEncode(todo.toJson());
    list.add(todoJson);
    store.setStringList('todo', list);
  }

  static changeStatus(TodoModel todo, int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("todo") ?? [];
    List<TodoModel> listOfTodo = [];
    list.forEach((element) {
      listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
    });
    listOfTodo.removeAt(index);
    listOfTodo.insert(index, todo);
    list.clear();
    listOfTodo.forEach((element) {
      list.add(jsonEncode(element.toJson()));
    });
    store.setStringList('todo', list);
  }

  static Future<List<TodoModel>> getListTodo() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('todo') ?? [];
    List<TodoModel> listOfTodo = [];
    list.forEach((element) {
      listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
    });

    return listOfTodo;
  }
}
