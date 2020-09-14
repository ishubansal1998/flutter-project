import "package:flutter/material.dart";
import 'package:hello/pages/home/home.dart';

class Setting extends StatefulWidget {
  final Cointype todo;
  Setting({Key key, @required this.todo}) : super(key: key);
  @override
  _SettingState createState() => _SettingState(todo);
}

class _SettingState extends State<Setting> {
  final Cointype todo;
  _SettingState(this.todo);
  //String dropdownValue ="USD";
  //dropdownValue todo.typ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
                leading: Text("Select Price Format : "),
                title: DropdownButton<String>(
                  value: todo.typ,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      todo.typ = newValue;
                    });
                  },
                  items: <String>[
                    "USD",
                    "INR",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            ListTile(
                title: Center(
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context, todo.typ);
                        },
                        child: Text(
                          "Go BACk",
                        )))),
          ]).toList(),
        ));
  }
}
