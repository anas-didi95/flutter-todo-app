import 'package:app/main.dart';
import 'package:app/util/constant.dart' as Constant;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoArchive extends StatefulWidget {
  @override
  _TodoArchiveState createState() => _TodoArchiveState();
}

class _TodoArchiveState extends State<TodoArchive> {
  @override
  Widget build(BuildContext context) {
    AppContext appContext = context.watch<AppContext>();
    var todoList = appContext.todoList;

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo Archive"),
          backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: todoList.length,
          itemBuilder: (_, i) => Text("Item $i"),
          separatorBuilder: (_, i) => Divider(),
        ));
  }
}
