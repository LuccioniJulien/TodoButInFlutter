import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/todo.dart';

class _DbTodo {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      _db = await _createDb();
    }
    return _db;
  }

  static Future<Database> _createDb() async {
  // open the database
    return openDatabase(await _getDbPath(), version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT, isDone INTEGER)');
    });
  }

  static Future<String> _getDbPath() async {
    var dbPath = await getDatabasesPath();
    return join(dbPath, 'todoButInFlutter.db');
  }

}

Future<List<Todo>> getTodos() {

}

Future<bool> insertTodo(Todo todo) {

}

Future<bool> removeTodo() {

}
