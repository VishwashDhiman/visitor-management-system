import 'package:flutter/material.dart';
import './main_content_screen.dart';
import './login.dart';
import './signup.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VMS")),
      body: MainPageContent(),
      drawer: HomePageDrawer(),
    );
  }
}

// Implemeted the drawer
class HomePageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("VMS",
                            style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))),
                    Expanded(child: DrawerImage())
                    ],
                 ),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  },
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  },
              ),
              ListTile(
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => UserLogin()));
                          },
                        child: Text("Login"),
                      )),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => UserSignUp()));
                            },
                          child: Text("Sign Up")))
                ],
              )
            ]));
  }
}

class DrawerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/VMS.png');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}
