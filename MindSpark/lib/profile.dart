import 'package:flutter/material.dart';
import 'test.dart';
void main() => runApp(new Profile());

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("Profile")
        ),
        body: new Test()
      ),
    );
  }
}