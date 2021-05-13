import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:todo_app/model/task%20model.dart';

class TaskCard extends StatelessWidget {
  final String title;
   String desc;

  TaskCard({this.title, this.desc});


  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:10.0,),
                    Text("${title}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    SizedBox(height:5.0,),
                    Text(desc ?? "No Description Avialable",style:TextStyle(fontWeight: FontWeight.w100),),
                    SizedBox(height:10.0,),
                  ],
                ),
              )

        ),
          ),
    );
  }
}

class TODO extends StatefulWidget {
  var checked;
  String text;
  TODO({this.checked,this.text});

  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: [
            CheckboxListTile(value:widget.checked,
                title: Text("${widget.text}"),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (newValue) {
              setState(() {
                widget.checked=newValue;
              });
            })
          ],
        ),

    );
  }
}
