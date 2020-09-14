import "package:flutter/material.dart";
import 'package:linkable/linkable.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text("Disclaimer: "),
            subtitle: Text("This App was developed for practice purpose only."),
          ),
          ListTile(
            leading: Text("Created By: "),
            title: Text("Ishaan Bansal"),
          ),
          ListTile(
              leading: Text("Source Code: "),
              title: Linkable(
                text: "https://github.com/ishubansal1998/api-flutter",
              )),
          ListTile(
              title: Center(
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go BACk",
                      )))),
        ]));
  }
}
