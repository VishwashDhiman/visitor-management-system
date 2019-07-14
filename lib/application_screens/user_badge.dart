import 'dart:io';

import 'package:flutter/material.dart';
import './take_picture.dart';
import './schedule_visit.dart';
import "package:intl/intl.dart";

class UserBadge extends StatelessWidget {
  var imagePath = getImagePath();
  var userName = name.text;
  var emailId = email.text;
  var hostNames = hostName.text;
  var date = DateFormat("dd-MM-yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Please collect your badge",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w100,
                fontFamily: "Roboto",
                color: Colors.blue)),
        Container(
            padding: EdgeInsets.all(10.0),
            height: 330.0,
            width: 300.0,
            child: Card(
              elevation: 15.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: FileImage(File(imagePath)),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "$userName",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontFamily: "Roboto"),
                    ),
                  ),
                  Text(
                    "Host",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                        color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "$hostNames",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontFamily: "Roboto"),
                    ),
                  ),
                  Text(
                    "Email Id",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                        color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "$emailId",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontFamily: "Roboto"),
                    ),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                        color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "$date",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontFamily: "Roboto"),
                    ),
                  ),
                ],
              ),
            )),
        Center(
            child: Icon(
          Icons.check_circle_outline,
          size: 80.0,
          color: Colors.green,
        )),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text("Thank you, you are all set!",
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w100,
                    color: Colors.green)),
          ),
        ),
        Center(
            child: Text("We have notified $hostNames! thank you are here.",
                style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w100)))
      ],
    );
  }
}
