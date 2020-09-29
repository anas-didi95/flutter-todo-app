import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: TodoList());
  }
}

class Todo {
  String title;
  bool isCheck;

  Todo({this.title, this.isCheck});
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _list2 = new List();
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              List<Todo> temp = new List();
              for (var todo in _list2) {
                if (!todo.isCheck) {
                  temp.add(todo);
                }
              }
              setState(() {
                _list2 = temp;
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _list2.length,
        itemBuilder: (ctx, i) {
          return Card(
              margin: EdgeInsets.all(4),
              child: ListTile(
                title: Text('$i: ${_list2[i].title}'),
                trailing: (_list2[i].isCheck
                    ? Icon(Icons.check_box, color: Colors.purple[200])
                    : Icon(Icons.check_box_outline_blank)),
                onTap: () {
                  setState(() {
                    _list2[i].isCheck = !_list2[i].isCheck;
                  });
                },
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list2.add(Todo(isCheck: false, title: "Hello world"));
          });
        },
        tooltip: 'Add todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
