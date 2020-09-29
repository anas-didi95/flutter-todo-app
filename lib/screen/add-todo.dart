import 'package:app/util/constant.dart' as Constant;
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ToDo'),
        backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
      ),
    );
  }
}
