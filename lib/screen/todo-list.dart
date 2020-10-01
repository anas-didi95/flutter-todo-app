import 'package:app/main.dart';
import 'package:app/screen/add-todo.dart';
import 'package:app/screen/todo-archive.dart';
import 'package:app/util/constant.dart' as Constant;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    AppContext appContext = context.watch<AppContext>();
    var todoList = appContext.todoList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
        actions: [
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => TodoArchive()));
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: todoList.length,
        itemBuilder: (ctx, i) {
          return Card(
              margin: EdgeInsets.all(4),
              child: ListTile(
                title: Text('$i: ${todoList[i].title}'),
                trailing: (todoList[i].isCheck
                    ? Icon(Icons.check_box,
                        color: Constant.COLOR_THEME[Constant.COLOR_NO_TICK])
                    : Icon(Icons.check_box_outline_blank)),
                onTap: () {
                  setState(() {
                    todoList[i].isCheck = !todoList[i].isCheck;
                  });
                },
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => AddTodo()));
          //});
        },
        tooltip: 'Add todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
