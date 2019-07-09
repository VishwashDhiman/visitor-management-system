import 'package:flutter/material.dart';
import './signup.dart';
import './book_demo.dart';
class MainPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .90;
    final double width = MediaQuery.of(context).size.width * .05;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookDemo("Leave us a message")));
        },
        child: Icon(Icons.message, size: 30.0,),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              color: Color(0xFF26C6DA),
              height: height,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Upgrade to a smart Visitor Management System",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w800,
                            fontSize: 40.0,
                            color: Colors.white),
                      )),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignUp()));
                          },
                          color: Color(0XFF29B6F6),
                          child: Text("Get Started",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)))),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookDemo("Book Demo")));
                          },
                          color: Color(0XFF29B6F6),
                          child: Text("Schedule a Demo",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)))),
                ],
              )),
          Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 70.0, bottom: 70.0),
                    padding: EdgeInsets.only(left: width*3),
                    child: Center(
                        child:
                        Text("INTELLIGENT VISITOR MANAGEMENT SYSTEM", style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "ZCOOLQing"
                        ))
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child:
                          Text("Greet your visitors with kiosk based visitor management "
                              "system that notify the hosts and print visitor badges all "
                              "through one sleek check-in terminal. Enhance your security and "
                              "corporate image with our best in class visitor management "
                              "solution - Vizmo. The era of the logbook is over.",
                            style: TextStyle(
                                fontFamily: "Roboto"
                            ),
                          )
                      )
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child:
                          Text(
                            "Capture detailed visitor information quickly and accurately to "
                                "identify, badge and track who is in your buildings and why."
                                " Present a more professional, security-conscious image to your "
                                "visitors and make visitors and employees feel safer",
                            style: TextStyle(
                                fontFamily: "Roboto"
                            ),
                          )
                      )
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child:
                          Text(
                            "Our Cloud-enabled, web-based visitor management system is "
                                "secure, easy to install, implement and maintain, reducing"
                                " costs and dependence on complicated costly IT infrastructure "
                                "and personnel.",
                            style: TextStyle(
                                fontFamily: "Roboto"
                            ),
                          )
                      )
                  ),

                  GetStarted(context, width),
                  FooterView()
                ],
              )
          ),
        ],
      )
    );
  }
}

Widget GetStarted(BuildContext context, double width){
  return Container(
      color: Colors.cyan,
    child: Column(
      children: <Widget>[
      Container(

        margin: EdgeInsets.only(top: 70.0, bottom: 50.0),
        padding: EdgeInsets.only(left: width),
        child: Center(
          child: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "ZCOOLQing"
              )
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserSignUp()));
              },
              color: Colors.green,
              child: Text("TRY VMS FOR FREE",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15.0)))),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDemo("Let's Get In Touch")));
              },
              color: Colors.white,
              child: Text("CONTACT US",
                  style: TextStyle(
                      color: Colors.black, fontSize: 10.0)))),
    ],
    )
  );
}

Widget FooterContent(String text){
  return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(text,
          style: TextStyle(
            fontFamily: "Handlee",
            fontSize: 20.0,
          ))
  );
}
Widget FooterView() {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
        child: Text(
          "VMS",
          style: TextStyle(
            fontFamily: "Handlee",
            fontSize: 20.0,
            fontWeight: FontWeight.w700
          )
        ),
      ),
      FooterContent("Innovation starts at the Door. The era of the logbook is over"
      ", the era of VMS is here."),
      Container(
        margin: EdgeInsets.only(top: 40.0, bottom: 30.0),
          padding: EdgeInsets.all(10.0),
          child: Text("COMPANY",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20.0,
                fontWeight: FontWeight.w800
              ))
      ),
      FooterContent("About Us"),
      FooterContent("Features"),
      FooterContent("Pricing"),
      FooterContent("Demo"),
      FooterContent("Support"),
      FooterContent("Terms of Use"),
    ],
  );
}