import 'package:flutter/material.dart';

import 'package:MindSpark/animations/FadeAnimation.dart';

class OnBoardTwo extends StatefulWidget {
  @override
  _OnBoardTwoState createState() => _OnBoardTwoState();
}

class _OnBoardTwoState extends State<OnBoardTwo> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadeAnimation(1, Text("Welcome", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                )
              ),
              SizedBox(height: 10,),
              FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/Illustration.png')
                  )
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}