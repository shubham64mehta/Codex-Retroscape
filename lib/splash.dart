import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:retro/Global/global.dart';
import 'package:retro/authscreen.dart';
import 'package:retro/home1.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      imagePath: 'images/logo.png',
      backGroundColor: Colors.deepOrange,
      animationEffect: 'zoom-in',
      logoSize: 200,
      home: check ? MainScreen() : AuthScreen(),
      duration: 8800,
      type: CustomSplashType.StaticDuration,
    );
  }
}
