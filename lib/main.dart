import 'package:app/modal/todo.dart';
import 'package:app/screen/todo-list.dart';
import "package:app/util/constant.dart" as Constant;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AppContext(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo',
        theme: ThemeData(primarySwatch: Constant.COLOR_THEME),
        home: TodoList());
  }
}

class AppContext with ChangeNotifier {
  List<Todo> _todoList = new List();
  List<Todo> get todoList => _todoList;

  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }
}
