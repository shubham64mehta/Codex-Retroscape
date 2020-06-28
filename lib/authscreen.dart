import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro/google.dart';
import 'package:retro/home1.dart';
import 'package:retro/main.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Login",
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          CircleAvatar(
            backgroundImage: ExactAssetImage("images/logo.png"),
            radius: 80,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 19,
          ),
          Text('"Where modern meets retro"', style: Flutter95.textStyle),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: RaisedButton(
              color: Colors.transparent,
              elevation: 40.0,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 17,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: ExactAssetImage("images/google.jpg"),
                    ),
                    SizedBox(
                      width: 55.0,
                    ),
                    FittedBox(
                      child: Text(
                        "Continue With Google ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                signInWithGoogle().whenComplete(() async {
                  Navigator.popAndPushNamed(context, '/Home2');
                  //SharedPreferences prefs = await SharedPreferences.getInstance();
                  //prefs.setString('alreadyregistered', user1);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
