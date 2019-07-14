import "package:flutter/material.dart";
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Invite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Invite();
  }
}

class _Invite extends State<Invite> {
  var _inviteFormKey = GlobalKey<FormState>();
  final _minimumPadding = 10.0;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController agenda = TextEditingController();

  var _currentlySelectedDuration;
  var _currentlySelectedVenu;
  var _duration = ['1 Hour', '2 Hours', '3 Hours', '6 Hours'];
  var _venues = ["Chandigarh", "Bangalore", "Hyderabad", "Delhi"];
  var date1;

  @override
  void initState() {
    super.initState();
    _currentlySelectedDuration = _duration[0];
    _currentlySelectedVenu = _venues[0];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _inviteFormKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  "INVITE FRIENDS",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: firstName,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'First Name*',
                        hintText: 'John',
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: lastName,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Last Name*',
                        hintText: 'Deo',
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  validator: (String value) {
                    if (value.isEmpty || !value.contains("@")) {
                      return "Please enter properly formated Email Id here";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Id*',
                    hintText: 'johndeo@abc.com',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DateTimePickerFormField(
                        inputType: InputType.both,
                        format: DateFormat("dd/MM/yy 'at' h:mma"),
                        editable: false,
                        decoration: InputDecoration(
                            labelText: "DateTime",
                            hasFloatingPlaceholder: false),
                        onChanged: (dt) {
                          setState(() => date1 = dt);
                        },
                        validator: (var value) {
                          if (value == null) {
                            debugPrint("Hhasdjsa ${value}");
                            return "Please select Event's date";
                          }
                        },
                      )),
                ),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text("Duration*"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),
                      child: DropdownButton<String>(
                        items: _duration.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentlySelectedDuration,
                        onChanged: (String newValueSelected) {
                          _onDurationDropDownSelect(newValueSelected);
                        },
                        hint: Text("Duration*"),
                      ),
                    ),
                  ],
                )),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text("Venue*"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
              child: DropdownButton<String>(
                items: _venues.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _currentlySelectedVenu,
                onChanged: (String newValueSelected) {
                  _onVenueDropDownSelect(newValueSelected);
                },
                hint: Text("Venue*"),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: agenda,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your agenda here";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Agenda*',
                    hintText: 'Meeting for production purpose',
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(_minimumPadding * 3),
                child: Builder(
                    builder: (context) => RaisedButton.icon(
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          color: Colors.blueAccent,
                          label: Text(
                            'Send Invitation',
                            textScaleFactor: 1.5,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_inviteFormKey.currentState.validate()) {
                                _inviteFormKey.currentState.reset();
                                showSnackBar(context);
                              }
                            });
                          },
                        ))),
          ],
        ));
  }

  void _onDurationDropDownSelect(String newValueSelected) {
    setState(() {
      this._currentlySelectedDuration = newValueSelected;
    });
  }

  void _onVenueDropDownSelect(String newValueSelected) {
    setState(() {
      this._currentlySelectedVenu = newValueSelected;
    });
  }
}

void showSnackBar(BuildContext context) {
  var snackBar = SnackBar(
    content: Text("Invitation Sent Successfully..."),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
