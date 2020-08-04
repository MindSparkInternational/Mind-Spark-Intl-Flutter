import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _controller.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("19222c"),
      body:  
        Center(
          child: 
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: 
                Container(
                  height: 175,
                  width: 175,
                  child: Image.asset("assets/img/MindSpark.png"),
                ),
              ),
              
              Align(
                alignment: Alignment.center,
                child: 
                Container(
                    height: 175,
                    width: 175,
                    child: Shimmer.fromColors(
                      child: Image.asset("assets/img/MindSparkBolt.png"), 
                      baseColor: Hexcolor("f3d266"), 
                      highlightColor: Hexcolor("FFFFFF")
                      ),
                  ),
              ),
            ],
          )
      )
    );
  }
}