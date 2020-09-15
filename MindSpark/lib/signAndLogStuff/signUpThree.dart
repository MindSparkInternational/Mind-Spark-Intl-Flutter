

import 'package:MindSpark/signAndLogStuff/signUp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SignUpThree extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String password;
  final String token;
  SignUpThree({this.firstName, this.lastName, this.password, this.token});
  @override
  _SignUpThreeState createState() => _SignUpThreeState(firstName: firstName, lastName: lastName, password: password, token: token);
}

class _SignUpThreeState extends State<SignUpThree> {
  String firstName;
  String lastName;
  String password;
  String token;
  _SignUpThreeState({this.firstName, this.lastName, this.password, this.token});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:     
        Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
          ),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () async{
              print(token);
              SharedPreferences preferences = await SharedPreferences.getInstance();
              preferences.setString("token", "Token " + token);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));

            },
          )
        ),
      ),
    );
  }
}