import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello/constants/config.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  String m = "";
  void fetchMovies() async {
    setState(() {
      isloading = true;
    });
    var res = await http.get(FMDBConfig.url,
        headers: {"X-CMC_PRO_API_KEY": "04324d90-2d9d-491c-8ae7-55fd0bf861db"});
    setState(() {
      m = res.body;
      isloading = false;
    });
    var decoded = jsonDecode(res.body);
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(child: Text(m)));
  }
}
