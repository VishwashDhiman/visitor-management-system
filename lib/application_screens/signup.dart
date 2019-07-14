import 'package:flutter/material.dart';
import './login.dart';
import './home_screen.dart';

class UserSignUp extends StatefulWidget {
  var cameras;

  UserSignUp(this.cameras);

  @override
  State<StatefulWidget> createState() {
    return _UserSignUp(cameras);
  }
}

class _UserSignUp extends State<UserSignUp> {
  // Unique form key
  var _signUpFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company = TextEditingController();
  var cameras;

  _UserSignUp(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Visitor Management System")),
        body: Form(
            key: _signUpFormKey,
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(20.0),
                child: Card(
                    elevation: 15.0,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: ListView(
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Enter Sign Up Details",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: userName,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter valid username';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'UserName',
                                  hintText: 'JohnDeo',
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15.0),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (String value) {
                                  if (value.isEmpty || !value.contains("@")) {
                                    return 'Please enter valid email';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'JohnDeo@abc.com',
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15.0),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: mobileNumber,
                                validator: (String value) {
                                  if (value.isEmpty || value.length != 10) {
                                    return 'Please enter valid 10 digit mobile number';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                  hintText: '9876543210',
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15.0),
                                ),
                              )),
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
                                    return 'Please enter at least 8 valid digit password';
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
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: company,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter valid company name';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Company',
                                  hintText: 'XYZ',
                                  errorStyle: TextStyle(
                                      color: Colors.red, fontSize: 15.0),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding * 3,
                                  left: _minimumPadding * 3,
                                  right: _minimumPadding * 3),
                              child: Builder(
                                  builder: (context) => RaisedButton(
                                        color: Colors.blueAccent,
                                        child: Text(
                                          'Sign Up',
                                          textScaleFactor: 1.5,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_signUpFormKey.currentState
                                                .validate()) {
                                              showSnackBar(context);
//                                    Navigator.pop(context);
                                              _signUpFormKey.currentState
                                                  .reset();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen(cameras)));
                                            }
                                          });
                                        },
                                      ))),
                          ListTile(
                            title: Text(
                              "Already Signed Up then login here.",
                              style: TextStyle(
                                  color: Colors.blue, fontFamily: "Roboto"),
                            ),
                            onTap: () {
                              _signUpFormKey.currentState.reset();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserLogin(cameras)));
                            },
                          )
                        ],
                      ),
                    )))));
  }

  String signedUpUserDetail() {
    String name = userName.text;
    return "Signed Up Successfully by $name";
  }

  void showSnackBar(BuildContext context) {
    String message = signedUpUserDetail();
    var snackBar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
