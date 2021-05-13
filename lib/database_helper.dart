import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
import 'package:sqflite/sql.dart';
import 'package:todo_app/model/task model.dart';
import 'package:todo_app/model/todo.dart';


class DataBaseHelper {
  Future<Database> database() async
  {
    //Basically makes a database file ,connects the database an creates a table in the database if not present
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    return openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute(
            "CREATE TABLE todo(id INTEGER PRIMARY KEY, title TEXT, taskId INTEGER,isDone INTEGER)");

        return db;
      },
    );
  }

  Future<int> insertTask(Task task) async
  {
    int idinserted;
    Database _db = await database(); //Make an instance of the Data base Widget that we made above and wait while it does some tasks tho
    idinserted=await _db.insert(
        "tasks", task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return idinserted;

  }

  Future<List<Task>> getTasks() async
  {
    Database _db = await database(); //Make a database instance everytime you want to do something
    List <Map<String, dynamic>> taskMap = await _db.query(
        "tasks"); //taskMap is a list that was returned by a database after querying.
    //Hence that has to convereted into praper task model again
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]["id"],
          title: taskMap[index]["title"],
          description: taskMap[index]["description"]);
    });
  }

  Future<void> insertTodo(Todo todo) async
  {
    Database _db = await database(); //Make an instance of the Data base Widget that we made above and wait while it does some tasks tho

    await _db.insert(
        "todo", todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

  }

  Future<List<Todo>> getTodo(int taskId) async
  {
    Database _db = await database(); //Make a database instance everytime you want to do something
    List <Map<String, dynamic>> todoMap = await _db.rawQuery("SELECT * FROM todo where taskId = $taskId");
        //taskMap is a list that was returned by a database after querying.
    //Hence that has to convereted into proper task model again
    return List.generate(todoMap.length, (index) {
      return Todo(
        id: todoMap[index]["id"],
        title: todoMap[index]["title"],
        isDone: todoMap[index]["isDone"],
        taskId: todoMap[index]["taskId"],
      );
    }
    );
  }

  Future<void> updateTaskTitle(int id,String title) async
  {
    Database _db =await database();
    await _db.rawInsert("UPDATE tasks SET title = '$title' WHERE ID = '$id'");
  }

  Future<void> updateTaskdesc(int id,String desc) async
  {
    if(id!=null) {
      Database _db = await database();
      await _db.rawInsert(
          "UPDATE tasks SET description = '$desc' WHERE ID = '$id'");
      print("Database Helper excuted updateTaskDesc");
    }
    else
      print("Id is null --DB Helper");
  }
}