import 'package:flutter/material.dart';
import './application_screens/home_screen.dart';

void main() => runApp(VisitorManagement());

class VisitorManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Visitor Management System",
        home: MyHomePage()
    );
  }
}


