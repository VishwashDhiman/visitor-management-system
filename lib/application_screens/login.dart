import "package:flutter/material.dart";

class UserLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserLogin();
  }
}

class _UserLogin extends State<UserLogin> {
  var _loginFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
                onPressed: (){
              // For releasing the route from stack.
              Navigator.pop(context);
            }),
            title: Text("Login")
        ),
        body: Form(
            key: _loginFormKey,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        // Simple validation for validating email
                        validator: (String value) {
                          if (value.isEmpty || !value.contains("@")) {
                            return 'Please enter valid email Id';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'JohnDeo@abc.com',
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
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
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.all(_minimumPadding * 3),
                          child: Builder(
                            builder: (context) =>RaisedButton(
                              child: Text(
                                'Login',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: (){
                                setState(() {
                                  if(_loginFormKey.currentState.validate()) {
                                    showSnackBar(context);
//                                    Navigator.pop(context);

                                  }
                                });
                              },
                            )
                          )
                  ),
                ]
                )
            )
        )
    );
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


