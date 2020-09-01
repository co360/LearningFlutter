import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();

  bool _autovalidate = false;

  String name;
  String email;
  String mobile;
  String collegename;

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      //saves to global key
      _key.currentState.save();

      //send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: name,
                    mobile: mobile,
                    email: email,
                    collegename: collegename,
                  )));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                Icon(Icons.person_add),
                ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: (input) => name = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter email';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (input) => email = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter mobile';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                    ),
                    onSaved: (input) => mobile = input,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Enter college name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'College name',
                    ),
                    onSaved: (input) => collegename = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                ButtonTheme(
                  height: 40.0,
                  minWidth: 200.0,
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: _sendToNextScreen,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
