import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/todo_model.dart';

abstract class LocalStrore {
  localStrore_();

  static setTodo(TodoModel todo) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('todo') ?? [];
    String todoJson = jsonEncode(todo.toJson());
    list.add(todoJson);
    store.setStringList('todo', list);
  }

  static editLocal(TodoModel todo, int index) async {
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

  static removeTodo(int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList('todo') ?? [];
    list.removeAt(index);
    store.setStringList('todo', list);
  }

  static setDone(TodoModel todo) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("done") ?? [];
    String todoJson = jsonEncode(todo.toJson());
    list.add(todoJson);
    store.setStringList("done", list);
  }

  static editLocalDone(TodoModel todo, int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("done") ?? [];
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
    store.setStringList("done", list);
  }

  static Future<List<TodoModel>> getListDone() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("done") ?? [];
    List<TodoModel> listOfTodo = [];
    list.forEach((element) {
      listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
    });
    return listOfTodo;
  }

  static removeDone(int index) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    List<String> list = store.getStringList("done") ?? [];
    list.removeAt(index);
    store.setStringList("done", list);
  }
}
