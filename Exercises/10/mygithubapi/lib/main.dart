import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github app',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(
        title: 'Parse Json data',
      ),
    );
  }
}
