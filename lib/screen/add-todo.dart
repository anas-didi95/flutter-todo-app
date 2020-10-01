import 'package:app/main.dart';
import 'package:app/modal/todo.dart';
import 'package:app/util/constant.dart' as Constant;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add ToDo'),
          backgroundColor: Constant.COLOR_THEME[Constant.COLOR_NO_APP_BAR],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, bottom: 5, right: 20, top: 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Field is mandatory!';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Save'),
                    color: Constant.COLOR_THEME,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        context.read<AppContext>().addTodo(
                            Todo(title: titleController.text, isCheck: false));
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
