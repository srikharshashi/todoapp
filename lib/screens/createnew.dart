import 'package:flutter/material.dart';
import 'package:todo_app/widgets.dart';

class createnew extends StatefulWidget {
  @override
  _createnewState createState() => _createnewState();
}

class _createnewState extends State<createnew> {
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
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter Title", border: InputBorder.none),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Enter Description", border: InputBorder.none),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
              ),

            TODO(checked: false,)
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.delete),),
    );
  }
}
