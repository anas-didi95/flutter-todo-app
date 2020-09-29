import 'package:app/screen/todo-list.dart';
import "package:app/util/constant.dart" as Constant;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
