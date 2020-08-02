import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("19222c"),
      body:  
        Center(
          child: 
          new Align(
            alignment: Alignment.center,
            child: new Container(
              height: 150,
              width: 150,
              child: Image.asset("assets/MindSpark.png"),
          ) 
        ),
      )
    );
  }
}