import 'package:app/modal/todo.dart';
import 'package:app/screen/todo-list.dart';
import "package:app/util/constant.dart" as Constant;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppContext(),
      )
    ],
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
  List<Todo> _todoList = List();
  List<Todo> _archiveList = List();

  List<Todo> get todoList => _todoList;
  List<Todo> get archiveList => _archiveList;

  void addTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  void clearSelection() {
    for (var todo in _todoList) {
      todo.isCheck = false;
    }
    notifyListeners();
  }

  void saveToArchive() {
    List<Todo> temp = List();
    for (var todo in _todoList) {
      if (todo.isCheck) {
        todo.isCheck = false;
        _archiveList.add(todo);
      } else {
        temp.add(todo);
      }
    }
    _todoList = temp;
    notifyListeners();
  }

  void clearArchive() {
    _archiveList.clear();
    notifyListeners();
  }
}
