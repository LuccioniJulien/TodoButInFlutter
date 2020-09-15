import 'package:flutter/material.dart';

Future<void> showMyDialog(
    BuildContext context,
    TextEditingController inputController,
    TextEditingController errorController,
    bool addTodo(),
    bool isNewTodoValid) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                      controller: inputController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'your todo',
                          errorText:
                              isNewTodoValid ? "" : errorController.text))
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  errorController.text = "";
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  if (!addTodo()) {
                    setState((){});
                    return;
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
