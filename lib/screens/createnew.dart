import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/widgets.dart';
import 'package:todo_app/model/task model.dart';

class taskpage extends StatefulWidget {
  final Task task;

  taskpage({this.task});

  @override
  _taskpageState createState() => _taskpageState();
}

class _taskpageState extends State<taskpage> {
  String _taskTitle="";

  @override
  void initState() {
    if(widget.task!=null)
      {
        _taskTitle=widget.task.title;
      }

        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(children: [
            Column(
              children: [
                Container(
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: TextEditingController()..text=_taskTitle,
                    decoration: InputDecoration(
                        hintText: "Enter Title", border: InputBorder.none),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    onSubmitted: (value) async {
                      if (value != "") {
                        if (widget.task == null) {
                          DataBaseHelper _dbHelper = DataBaseHelper();
                          Task newtask = Task(title: value);
                          await _dbHelper.insertTask(newtask);
                        }
                        else
                        {
                          print("Task Update Trigger");
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
                        hintText: "Enter Decription", border: InputBorder.none),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                    keyboardType: TextInputType.multiline,

                    // minLines: 2,
                    maxLines: null,
                  ),
                ),
                TODO(checked: false, text: "Lmao1"),

              ],
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
