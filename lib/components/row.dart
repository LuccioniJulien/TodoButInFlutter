import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

Card bindRow(Todo todo, updateIsDone(bool isDone), void delete()) {
  return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Text(
                todo.title,
                style: todo.isDone ?? false
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : null,
              ),
            ),
            Checkbox(
              onChanged: updateIsDone,
              value: todo.isDone ?? false,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: delete,
            )
          ],
        ),
        height: 60,
        padding: EdgeInsets.all(8.0),
      ));
}
