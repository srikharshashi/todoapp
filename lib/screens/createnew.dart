import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
          padding: const EdgeInsets.all(25.0),
          child: ListView(children: [
            Column(
              children: [
                Container(
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Title", border: InputBorder.none),
                    style:TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold) ,
                  ),
                ),
                Container(
                  // decoration:
                      // BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Decription", border: InputBorder.none),
                    style:TextStyle(fontSize: 20,fontWeight: FontWeight.w100) ,
                    // minLines: 2,
                    maxLines: null,
                  ),
                ),
                TODO(checked: false,text:"Lmao1"),
                TODO(checked: false,text:"Lmao1"),
                TODO(checked: false,text:"Lmao1"),
                TODO(checked: false,text:"Lmao1"),


              ],
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete,),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
