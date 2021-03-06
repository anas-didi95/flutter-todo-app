import 'package:app/component/todo-item.dart';
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
    var archiveList = appContext.archiveList;

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo Archive"),
          backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
          actions: [
            IconButton(
                icon: Icon(Icons.clear_all),
                tooltip: 'Clear All',
                onPressed: () => context.read<AppContext>().clearArchive())
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: archiveList.length,
          itemBuilder: (_, i) => TodoItem(
            todo: archiveList[i],
            idx: i,
          ),
        ));
  }
}
