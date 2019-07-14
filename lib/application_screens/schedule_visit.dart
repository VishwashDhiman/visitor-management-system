import "package:flutter/material.dart";
import "./take_picture.dart";
import './user_badge.dart';

class ScheduleVisit extends StatefulWidget {
  var cameras;

  ScheduleVisit(this.cameras);

  @override
  State<StatefulWidget> createState() {
    return _ScheduleUserVisit(cameras);
  }
}

final _userDetailFormKey = GlobalKey<FormState>();
final _minimumPadding = 10.0;
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController hostName = TextEditingController();

Widget _userDetailForm() {
  return Form(
      key: _userDetailFormKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Generate your Visiting Badge easily in just 3 simple steps",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: name,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter valid name';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'JohnDeo',
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                validator: (String value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return 'Please enter valid email id';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Email Id',
                  hintText: 'JohnDeo@abc.com',
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: hostName,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter valid host name';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Host Name',
                  hintText: 'Alen Walker',
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                ),
              )),
        ],
      ));
}

StepState _getState(int i) {
  if (currentStep > i) return StepState.complete;
  return StepState.disabled;
}

int currentStep = 0;

List<Step> _getSteps(BuildContext context, var cameras) {
  return [
    Step(
        title: Text('Step 1'),
        content: _userDetailForm(),
        isActive: true,
        state: _getState(0)),
    Step(
        title: Text('Step 2'),
        content: CameraHome(cameras),
        isActive: true,
        state: _getState(1)),
    Step(
        title: Text('Step 3'),
        content: UserBadge(),
        isActive: true,
        state: _getState(2))
  ];
}

class _ScheduleUserVisit extends State<ScheduleVisit> {
  var cameras;

  _ScheduleUserVisit(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stepper(
          currentStep: currentStep,
          steps: _getSteps(context, cameras),
          type: StepperType.horizontal,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < 2) {
                if (currentStep == 0 &&
                    !_userDetailFormKey.currentState.validate()) {
                  debugPrint("Not Validated");
                } else {
//                  _userDetailFormKey.currentState.reset();
                  currentStep = currentStep + 1;
                }
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  currentStep == 2 // this is the last step
                      ? RaisedButton.icon(
                          icon: Icon(Icons.save),
                          label: Text('Save Badge'),
                          onPressed: () {
                            showSnackBar(context);
                          },
                          color: Colors.green,
                        )
                      : RaisedButton.icon(
                          icon: Icon(Icons.navigate_next),
                          onPressed: onStepContinue,
                          label: Text('Continue'),
                        ),
                  FlatButton.icon(
                    icon: Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    onPressed: onStepCancel,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      content: Text("Your data is saved safely"),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
