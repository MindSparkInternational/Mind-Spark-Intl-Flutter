

import 'package:MindSpark/signAndLogStuff/signUp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            onPressed: () {
              print(token);
              var request = http.MultipartRequest('POST', Uri.parse("https://mindsparkapi.herokuapp.com/endpoint/create_post"));
              http.post("https://mindsparkapi.herokuapp.com/endpoint/create_post", headers: {"Authorization":"Token cde832d427bcd0f312de8b28dc8a0ba56daa80fb"}, body: {"body":{"body":"test"}, "sub_head":"test", "type":"test","fields":"test","title":"test"});

            },
          )
        ),
      ),
    );
  }
}