import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/screens/createnew.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.nunitoSansTextTheme()),
      routes: {
        "/":(context) => Homee(),
        "/createnew":(context) => createnew(),

      },
    );
  }
}
