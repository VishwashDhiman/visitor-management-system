import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserSignUp();
  }
}

class _UserSignUp extends State<UserSignUp> {
  var _signUpFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                }),
            title: Text("SignUp")
        ),
        body: Form(
            key: _signUpFormKey,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
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
                                  color: Colors.red,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
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
                                  color: Colors.red,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
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
                                  color: Colors.red,
                                  fontSize: 15.0
                              ),
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
                              return 'Please enter at least 8 valid digit password';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'UserName',
                              hintText: 'JohnDeo@1',
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: _minimumPadding, bottom: _minimumPadding),
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
                                  color: Colors.red,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding * 3),
                            child: RaisedButton(
                              child: Text(
                                'Sign Up',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: (){
                                setState(() {
                                  if(_signUpFormKey.currentState.validate()) {
                                    showSnackBar(context);
//                                    Navigator.pop(context);
                                  }
                                });
                              }
                        )
                    ),
                  ],
                )
            )
        )
    );
  }
  String signedUpUserDetail () {
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

