import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safesenora/auth/login.dart';

class FirstScreen extends StatefulWidget {
  FirebaseUser user;
  FirstScreen(this.user);
  @override
  _FirstScreenState createState() => _FirstScreenState(user);
}

class _FirstScreenState extends State<FirstScreen> {
  FirebaseUser user;
  _FirstScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("safesenora")),
      body: ListView(
        children: <Widget>[
          Text("User email ${user.uid}"),
          Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              color: Colors.lightBlue,
              onPressed: () {
                setState(() {
                  _signout(context);
                });
              },
              elevation: 11,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(40))),
              child: Text(
                "Log out",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          )
        ],
      )
    );
  }

  void _signout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
