import "package:flutter/material.dart";

class MyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(children: <Widget>[
          TopicHeading("Product"),
          TopicContent("Mobile Access"),
          TopicContent("Building Sync"),
          TopicContent("Visitor Management"),
          TopicHeading("Company"),
          TopicContent("Free Quote"),
          TopicContent("Getting Started"),
          TopicContent("Blog"),
          TopicContent("Help Center"),
          TopicHeading("Resources"),
          TopicContent("Getting Started"),
          TopicContent("Integrations"),
          TopicContent("Free quote"),
          TopicContent("API Document")
        ]));
  }
}

Widget TopicHeading(String heading) {
  return Container(
    padding: EdgeInsets.all(10.0),
    alignment: Alignment.centerLeft,
    child: Text(heading,
        style: TextStyle(
            color: Colors.white, fontFamily: "Roboto", fontSize: 20.0)),
  );
}

Widget TopicContent(String content) {
  return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.centerLeft,
      child: Text(content,
          style: TextStyle(color: Colors.white70, fontFamily: "Roboto")));
}
