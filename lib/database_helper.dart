import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'package:sqflite/sql.dart';
import 'package:todo_app/model/task model.dart';


class DataBaseHelper {
  Future<Database> database() async
  {
    //Basically makes a database file ,connects the database an creates a table in the database if not present
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    return openDatabase(path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      },
    );
  }

  Future<void> insertTask(Task task) async
  {
    Database _db = await database(); //Make an instance of the Data base Widget that we made above and wait while it does some tasks tho
    await _db.insert(
        "tasks", task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async
  {
    Database _db = await database(); //Make a database instance everytime you want to do something
    List <Map<String, dynamic>> taskMap = await _db.query("tasks"); //taskMap is a list that was returned by a database after querying.
    //Hence that has to convereted into praper task model again
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]["id"],
          title: taskMap[index]["title"],
          description: taskMap[index]["description"]);
    });
  }
}

