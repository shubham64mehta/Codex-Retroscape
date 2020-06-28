import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro/Global/global.dart';
import 'package:retro/authscreen.dart';
import 'package:retro/hindivideos.dart';
import 'package:retro/home1.dart';
import 'package:retro/splash.dart';
import 'package:retro/videosenglish.dart';
import 'package:retro/videospage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  name = prefs.get('name');
  imageUrl = prefs.get('image');
  check = prefs.containsKey('already');
  runApp(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/Home1': (BuildContext context) => AuthScreen(),
        '/Home2': (BuildContext context) => MainScreen()
      },
      debugShowCheckedModeBanner: false,
      color: Flutter95.black,
      home: Initial()));
  // prefs.containsKey('already') ? MainScreen() : AuthScreen()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Videos",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: Button95(
              child: Text(
                "English",
                style: Flutter95.textStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 18,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: Button95(
              child: Text(
                "Hindi",
                style: Flutter95.textStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
