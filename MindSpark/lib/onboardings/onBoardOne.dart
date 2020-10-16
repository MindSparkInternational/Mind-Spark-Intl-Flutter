import 'package:flutter/material.dart';

import 'package:MindSpark/animations/FadeAnimation.dart';
import 'package:hexcolor/hexcolor.dart';

class OnBoardOne extends StatefulWidget {
  @override
  _OnBoardOneState createState() => _OnBoardOneState();
}

class _OnBoardOneState extends State<OnBoardOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#059b9c"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(
                  1,
                  Text(
                    "Welcome to Mind Spark",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              SizedBox(
                height: 10,
              ),
              FadeAnimation(
                  1.4,
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/image0.png")
                          )
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
