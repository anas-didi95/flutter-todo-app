import 'package:app/modal/todo.dart';
import 'package:app/util/constant.dart' as Constant;
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final int idx;

  TodoItem({@required this.todo, @required this.idx});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(4),
        child: ListTile(
          title: Text('$idx: ${todo.title}'),
          trailing: (todo.isCheck
              ? Icon(Icons.check_box,
                  color: Constant.COLOR_THEME[Constant.COLOR_NO_TICK])
              : Icon(Icons.check_box_outline_blank)),
        ));
  }
}
