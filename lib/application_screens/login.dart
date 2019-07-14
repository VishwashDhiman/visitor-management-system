import "package:flutter/material.dart";
import './home_screen.dart';

class UserLogin extends StatefulWidget {
  var cameras;

  UserLogin(this.cameras);

  @override
  State<StatefulWidget> createState() {
    return _UserLogin(cameras);
  }
}

class _UserLogin extends State<UserLogin> {
  var _loginFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var cameras;

  _UserLogin(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("VMS")),
        body: Form(
            key: _loginFormKey,
            child: Container(
                height: 380.0,
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                child: Card(
                    elevation: 15.0,
                    child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: ListView(
                          children: <Widget>[
                            Center(
                                child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: _minimumPadding,
                                    bottom: _minimumPadding),
                                child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: email,
                                    // Simple validation for validating email
                                    validator: (String value) {
                                      if (value.isEmpty ||
                                          !value.contains("@")) {
                                        return 'Please enter valid email Id';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'JohnDeo@abc.com',
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 15.0),
                                    ))),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: _minimumPadding,
                                    bottom: _minimumPadding),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: password,
                                  obscureText: true,
                                  validator: (String value) {
                                    if (value.isEmpty || value.length < 8) {
                                      return 'Please enter valid password';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'JohnDeo@1',
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.all(_minimumPadding * 3),
                                child: RaisedButton(
                                  color: Colors.blueAccent,
                                  child: Text('Login',
                                      textScaleFactor: 1.5,
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    setState(() {
                                      if (_loginFormKey.currentState
                                          .validate()) {
                                        _loginFormKey.currentState.reset();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(cameras)));
                                        showSnackBar(context);
                                      }
                                    });
                                  },
                                )),
                          ],
                        ))))));
  }

  // Generating message
  String loggedInUserDetails() {
    String userID = email.text;
    return "Welcom back $userID";
  }

  // Displaying message using Snackbar
  void showSnackBar(BuildContext context) {
    String message = loggedInUserDetails();
    var snackBar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
