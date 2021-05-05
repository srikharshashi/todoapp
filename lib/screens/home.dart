import 'package:flutter/material.dart';
import 'package:todo_app/widgets.dart';

class Homee extends StatefulWidget {
  @override
  _HomeeState createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ]),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
              TaskCard(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, "/createnew");},
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
