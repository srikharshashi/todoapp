import 'package:flutter/material.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/widgets.dart';
import 'package:todo_app/screens/createnew.dart';
class Homee extends StatefulWidget {
  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
DataBaseHelper _dataBaseHelper =DataBaseHelper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future:_dataBaseHelper.getTasks(),
              initialData: [],
              builder: (context,snapshot)
              {
                return ListView.builder(
                  itemBuilder:(context,index) =>
                      GestureDetector(
                          child: TaskCard(title: snapshot.data[index].title,desc: snapshot.data[index].description,),
                          onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => taskpage(task: snapshot.data[index])
                          )
                      ).then((value) {setState(() {

                      });});
                    },
                  ),
                  itemCount:snapshot.data.length,);
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => taskpage(task: null)
                )
            ).then((value) {setState(() {

            });});
        },
          child: Image(
            image: AssetImage(
              "assets/images/add_icon.png",
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
