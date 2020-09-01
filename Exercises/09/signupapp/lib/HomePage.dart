import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final String collegename;

  HomePage(
      {Key key, @required this.name, this.email, this.mobile, this.collegename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('Students info'),
      ),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
              ),
              Icon(Icons.person),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(mobile),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(collegename),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
