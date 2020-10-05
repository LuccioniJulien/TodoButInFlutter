import 'package:sqflite/sqflite.dart';

import '../model/todo.dart';

class _DbTodo {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = await getDatabasesPath();
      _db = await openDatabase(path + 'todoButInFlutterDb.db');
    }
    return _db;
  }
}

Future<Todo> getTodos() {}

Future<bool> insertTodo() {}

Future<bool> removeTodo() {}
