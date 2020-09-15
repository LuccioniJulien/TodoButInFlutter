import 'package:flutter/material.dart';
import 'package:todo/components/dialog.dart';
import 'package:todo/components/row.dart';
import 'package:todo/model/todo.dart';

class TodoHome extends StatefulWidget {
  TodoHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Todo> _todos = List();
  final inputController = TextEditingController();
  final errorController = TextEditingController();

  bool _addTodo() {
    if (inputController.text == "") {
      errorController.text = "Please fill the input";
      setState(() {});
      return false;
    } else {
      errorController.text = "";
    }

    _todos.add(Todo(inputController.text));
    inputController.text = "";
    setState(() {});
    return true;
  }

  void updateIsDone(bool isDone, int index) {
    _todos[index]?.isDone = isDone;
    setState(() {});
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return bindRow(
                    _todos[index],
                    (bool isDone) => updateIsDone(isDone, index),
                    () => deleteTodo(index));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showMyDialog(context, inputController, errorController, _addTodo),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
