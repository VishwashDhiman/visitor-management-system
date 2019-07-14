import 'package:flutter/material.dart';
import './main_content_screen.dart';

class SettingScreen extends StatelessWidget {
  var cameras;

  SettingScreen(this.cameras);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              "Terms of service",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Roboto",
                  color: Colors.lightBlueAccent),
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPageContent(cameras)));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Roboto",
                  color: Colors.lightBlueAccent),
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPageContent(cameras)));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(
              "Know more about VMS",
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Roboto",
                  color: Colors.lightBlueAccent),
            ),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPageContent(cameras)));
            },
          ),
        ),
        Container(
            margin: EdgeInsets.all(35.0),
            padding: EdgeInsets.all(10.0),
            child: RaisedButton.icon(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
              label: Text(
                "LOGOUT",
                style: TextStyle(color: Colors.white, fontFamily: "Roboto"),
              ),
            )),
      ],
    );
  }
}
