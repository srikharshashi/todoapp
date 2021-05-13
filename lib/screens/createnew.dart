import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets.dart';
import 'package:todo_app/model/task model.dart';

class taskpage extends StatefulWidget {
  final Task task;

  taskpage({this.task});

  @override
  _taskpageState createState() => _taskpageState();
}

class _taskpageState extends State<taskpage> {
  String _taskTitle = "";
  String _todoTitle;
  int _taskId;
  DataBaseHelper _dbHelper = DataBaseHelper();
  Task newtask;



  @override
  void initState() {
    if (widget.task != null) {
      _taskTitle = widget.task.title; // null if new or  contains value if coming from existing card
      _taskId = widget.task.id;  //null if new
    }

    super.initState();
  }

 void insertTodo(String title) async {
    print("Entered insert Todo");
   if (title != "") {
     if (widget.task != null || _taskTitle!=null) {
        _dbHelper = DataBaseHelper();
       Todo newtodo = Todo(title: title, isDone: 0, taskId: _taskId);
       await _dbHelper.insertTodo(newtodo);
       print("todo was made");
     }
     else
       print("In todo widget . task is null ");
   }
 }

  TextEditingController customcontroler = TextEditingController();

  Future<String> createAlertDia(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create TODO!!"),
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15.0)),
            content: TextField(
              controller: customcontroler,
            ),
            actions: [
              ElevatedButton(
                child: Text("Submit!"),
                onPressed: () {
                  Navigator.of(context).pop(customcontroler.text.toString());
                  customcontroler.clear();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " ",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: TextEditingController()..text = _taskTitle,
                        decoration: InputDecoration(
                            hintText: "Enter Title", border: InputBorder.none),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        onSubmitted: (value) async {
                          if (value != "") {
                            if (widget.task == null) //If we came from create new it means
                            {
                               newtask = Task(title: value);
                              _taskId=await _dbHelper.insertTask(newtask);
                              _todoTitle=value;
                              print("Task id is $_taskId has been set");
                              print("Task Inserted with title ${newtask.title}");
                            }
                            else {
                              await _dbHelper.updateTaskTitle(_taskId,value);
                              print("Task  Title Upadated");
                              _todoTitle=value;
                              _taskId=widget.task.id;
                              print("Task id is $_taskId ");
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      // decoration:
                      // BoxDecoration(border: Border.all(color: Colors.black)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter Decription",
                            border: InputBorder.none),

                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w100),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        // minLines: 2,
                        maxLines: null,
                        onSubmitted: (value) async{
                           if(value!="")
                             {
                               if(_taskTitle!=null )
                                 {
                                     await  _dbHelper.updateTaskdesc(_taskId, value);
                                      print("Updated Description for task $_taskId");
                                 }
                             }
                        },
                      ),
                    ),
                    Container(
                      child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getTodo(_taskId),
                          builder: (context, snapshot) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return TODO(
                                    checked: snapshot.data[index].isDone == 0
                                        ? false
                                        : true,
                                    text: snapshot.data[index].title,
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ],
            )),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          children: [
            SpeedDialChild(
              child: Icon(Icons.delete_forever),
            ),
            SpeedDialChild(
                child: Icon(Icons.access_alarm),
                onTap: () async => createAlertDia(context).then((value) async {
                      _todoTitle = value;
                      await insertTodo(_todoTitle);
                      setState(() {

                      });
                    })),
          ],
        ));
  }
}
