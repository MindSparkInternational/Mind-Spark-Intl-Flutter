import 'package:MindSpark/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class SignUpTwo extends StatefulWidget {
  final String firstName;
  SignUpTwo({this.firstName});
  @override
  _SignUpTwoState createState() => _SignUpTwoState(firstName);
}

class _SignUpTwoState extends State<SignUpTwo> {
  String firstName;
  _SignUpTwoState(this.firstName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            height: MediaQuery.of(context).size.height-200,
            width: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Welcome to Mind Spark, $firstName", textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, Text("We just need a bit more information about before we continue", textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[700]
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, makeInput(label: "Please enter your email")),
                  SizedBox(height:30),
                  FadeAnimation(3, 
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                      ),
                      child: MaterialButton(
                        onPressed: (){

                        },
                        minWidth: double.infinity,
                        height: 100,
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Continue", style: TextStyle(
                          fontWeight: FontWeight.w600, 
                          fontSize: 30
                        ),),
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
          ),
        )
      )
    );
  }
  Widget makeInput({label, obscureText = false, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}