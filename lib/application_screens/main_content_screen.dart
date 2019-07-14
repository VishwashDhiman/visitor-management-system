import "package:flutter/material.dart";
import "./Footer.dart";
import "./book_demo.dart";
import "./signup.dart";

class MainPageContent extends StatelessWidget {
  var cameras;

  MainPageContent(cameras);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VMS"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDemo("Leave us a message")));
        },
        child: Icon(Icons.message),
      ),
      body: PageContent(cameras),
    );
  }
}

class PageContent extends StatelessWidget {
  var cameras;

  PageContent(this.cameras);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
//          height: 00.0,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.elliptical(1100.0, 1000.0),
                  )),
              child: Center(
                  child: Column(
                children: <Widget>[
                  IconImage(),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Welcome to Modern Visitor management",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontFamily: "Roboto",
                          ))),
                  Container(
                      margin: EdgeInsets.only(
                          top: 15.0, right: 100.0, left: 15.0, bottom: 15.0),
                      child: Text(
                          "Access Control + "
                          "Integrated Visitor Management",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w300))),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10.0),
                      child: RaisedButton(
                        color: Colors.indigo,
                        padding: EdgeInsets.all(15.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDemo("Book Demo")));
                        },
                        child: Text(
                          "SCHEDULE A DEMO",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                  TabView(),
                ],
              ))),
        ),
        Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("How does it work?",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 25.0,
                            fontFamily: "Roboto"))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        "Our iPad app allows your visitors to check in themselves so "
                        "you can focus on giving them a friendly welcome. You can"
                        " start tracking all visitors entries digitally and throw"
                        " away the paper book on your desk.",
                        style: TextStyle(fontFamily: "Roboto"))),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  child: Text("Visitor Sign-in",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20.0,
                          fontFamily: "Roboto")),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "When a visitor arrives, they’ll enter their "
                      "information on to the iPad, if required sign NDA"
                      " and collect their visitor badge.",
                      style: TextStyle(fontFamily: "Roboto")),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  child: Text("Host gets notified",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20.0,
                          fontFamily: "Roboto")),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Sequr automatically notifies your employee when their "
                      "guest arrives by Slack, email, SMS or mobile app"
                      " notification.",
                      style: TextStyle(fontFamily: "Roboto")),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10.0),
                  child: Text("Host greets their guest",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20.0,
                          fontFamily: "Roboto")),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      "Host knows who to meet and gives friendly welcome to "
                      "their guests.",
                      style: TextStyle(fontFamily: "Roboto")),
                ),
                DemoVideo(),
              ],
            )),
        Container(
            color: Color(0xFFEEEEEE),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(40.0),
                  child: Text("iPad features",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 25.0,
                          fontFamily: "Roboto")),
                ),
                IpadFeatures(),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 60.0),
                  child: Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Customize branding",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 15.0,
                                        fontFamily: "Roboto")),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Photo capture",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 15.0,
                                        fontFamily: "Roboto")),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.notifications,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Instant Arrival Notifications",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 15.0,
                                        fontFamily: "Roboto")),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.print,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Print visitor badges",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 15.0,
                                        fontFamily: "Roboto")),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30.0),
              child: Center(
                child: Text("Features",
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 25.0,
                        fontFamily: "Roboto")),
              ),
            ),
            Features(
                "Unlimited Visitors & Devices",
                "Sequr welcomes all of your visitors & start tracking all guest"
                    " entries digitally."),
            Features(
                "Customize Branding",
                "Impress your visitors & give the first right impression with"
                    " your logo & your color!"),
            Features(
                "Collect Visitors' Information",
                "Capture name, company name, email, photo, purpose of "
                    "visit and more."),
            Features("Capture Photos",
                "Create instant photo badges by capturing photos with Sequr."),
            Features(
                "Sign NDA & Waivers",
                "Visitors can sign legal documents digitally with the touch "
                    "of their finger."),
            Features(
                "Print Visitor Badges",
                "Quickly identify visitors with photo/name badges for improved "
                    "security."),
            Features(
                "Notify Employees",
                "Notify your employees of a visit by email, SMS, Slack"
                    " or Sequr mobile app."),
            Features(
                "Report & Analytics",
                "View and filter your visitor logs and get insights to "
                    "better manage your office."),
            Features(
                "Centralized Management",
                "Keep track of all visitors’ information in the Sequr"
                    " dashboard."),
            Features("Multiple Locations",
                "Easily manage all of your offices in one place."),
            Features("Vault",
                "Keep track of all your signed agreements in one place."),
          ],
        ),
        Container(
            padding: EdgeInsets.only(bottom: 100.0),
            color: Color(0xFFEEEEEE),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Want to see Sequr in action?",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 25.0,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Schedule a demo or get a free quote",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.indigo,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDemo("Book Demo")));
                      },
                      child: Text(
                        "SCHEDULE A DEMO",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.indigo,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSignUp(cameras)));
                      },
                      child: Text(
                        "FREE QUOTE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        MyFooter()
      ],
    );
  }
}

class IconImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/icon.webp');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/hero.webp');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
}

class DemoVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/visitor-ipad.webp');
    Image image = Image(image: assetImage);
    return Container(
        margin: EdgeInsets.only(top: 25.0),
        padding: EdgeInsets.all(20.0),
        child: image);
  }
}

class IpadFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/ipad-features.png');
    Image image = Image(image: assetImage);
    return Container(
        margin: EdgeInsets.only(top: 25.0),
        padding: EdgeInsets.all(20.0),
        child: image);
  }
}

Widget Features(String header, String content) {
  return Container(
    padding: EdgeInsets.all(15.0),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Text(header,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18.0,
                fontFamily: "Roboto",
              )),
        ),
        Text(content,
            style: TextStyle(
              fontFamily: "Roboto",
            )),
      ],
    ),
  );
}
