import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import './application_screens/signup.dart';
List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(VisitorManagement());
}

class VisitorManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialized a material app
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Visitor Management System",
        home: UserSignUp(cameras)
    );
  }
}