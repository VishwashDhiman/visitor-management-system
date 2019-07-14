import "package:flutter/material.dart";

class BookDemo extends StatefulWidget {
  String title = '';

  BookDemo(this.title);

  @override
  State<StatefulWidget> createState() {
    return _BookDemo(this.title);
  }
}

class _BookDemo extends State<BookDemo> {
  String title = "";

  var _bookDemoFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController message = TextEditingController();

  _BookDemo(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Form(
            key: _bookDemoFormKey,
            child: Container(
                padding: EdgeInsets.all(25.0),
                color: Colors.blueAccent,
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListView(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: name,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'Your Name',
                                    hintText: 'JohnDeo',
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: email,
                                validator: (String value) {
                                  if (value.isEmpty || !value.contains("@")) {
                                    return 'Please enter valid email Id';
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    hintText: 'JohnDeo@abc.com',
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: contactNumber,
                                validator: (String value) {
                                  if (value.isEmpty || value.length < 10) {
                                    return 'Please enter valid 10 digit phone number';
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'Mobile Number',
                                    hintText: 'JohnDeo@1',
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: _minimumPadding,
                                  bottom: _minimumPadding),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: message,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your message here';
                                  }
                                },
                                decoration: InputDecoration(
                                    labelText: 'Your Message',
                                    errorStyle: TextStyle(
                                        color: Colors.red, fontSize: 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              )),
                          Padding(
                              padding: EdgeInsets.all(_minimumPadding * 3),
                              child: Builder(
                                  builder: (context) => RaisedButton(
                                        color: Colors.blueAccent,
                                        child: Text(
                                          'Send',
                                          textScaleFactor: 1.5,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (_bookDemoFormKey.currentState
                                                .validate()) {
                                              showSnackBar(context);
//                                    Navigator.pop(context);

                                            }
                                          });
                                        },
                                      ))),
                        ]))))));
  }
}

void showSnackBar(BuildContext context) {
  var snackBar = SnackBar(
    content: Text("We will react you as soon as possible!!!!"),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
