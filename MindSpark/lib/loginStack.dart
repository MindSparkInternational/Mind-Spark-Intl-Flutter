import 'package:MindSpark/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/loginScreen.dart';

class LoginStack extends StatefulWidget {
  @override
  _LoginStackState createState() => _LoginStackState();
}

class _LoginStackState extends State<LoginStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Login(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0)
            ),
            
          ),
        ],
      )
    );
  }
}