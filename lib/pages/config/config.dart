import 'package:flutter/material.dart';
import 'package:hello/pages/home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue[300]),
      home: HomePage(),
    );
  }
}
