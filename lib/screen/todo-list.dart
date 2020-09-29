import 'package:app/modal/todo.dart';
import 'package:flutter/material.dart';
import 'package:app/util/constant.dart' as Constant;

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todoList = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
        actions: [
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              List<Todo> temp = new List();
              for (var todo in todoList) {
                if (!todo.isCheck) {
                  temp.add(todo);
                }
              }
              setState(() {
                todoList = temp;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
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
          setState(() {
            todoList.add(Todo(isCheck: false, title: "Hello world"));
          });
        },
        tooltip: 'Add todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
