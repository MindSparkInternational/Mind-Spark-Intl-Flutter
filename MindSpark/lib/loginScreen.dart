import 'package:MindSpark/main.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );
  final kBoxDecorationStyle = BoxDecoration(
    color: Hexcolor("#19223c"),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.white38,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
  final kHintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity, 
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, 
                end:Alignment.bottomCenter,
                colors: [
                  Hexcolor("#19222c"),
                  Hexcolor("#19223c"),
                  Hexcolor("#192253")
                  //Color(0xFF73AEF5),
                  //Color(0xFF61A4F1),
                  //Color(0xFF478DE0),
                  //Color(0xFF398AE5),
                ],
                stops: [.1,.5,.7]
              )
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  buildEmailTF(),
                  SizedBox(
                    height: 30.0,
                  ),
                  buildPassTF(),
                  buildForgotPass(),
                  buildRememberMe(),
                  buildLoginButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget buildEmailTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14.0),
              prefixIcon: Icon(Icons.email, color: Colors.white,),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
  
          ),
        )
      ],
    );
  }

  Widget buildPassTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.white,),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
  
          ),
        )
      ],
    );
  }
  Widget buildForgotPass(){
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Forgot pass button pressed"),
        padding: EdgeInsets.only(right:0.0),
        child: Text("Forgot Password?", style: kLabelStyle,),
      ),
    );
  }
  Widget buildRememberMe(){
    return Container(
      child: Row(
        children: <Widget>[
          Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: rememberMe, 
            checkColor: Colors.white, 
            onChanged: (value) {
                setState(() {
                  rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Remember Me",
            style: kLabelStyle,
          ),
        ],
      )
    );
  }
  Widget buildLoginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:25.0),
      child: RaisedButton(
        onPressed: (){
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Hexcolor("#192253"),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: "OpenSans",

          ),
          ),
      ),
      width: double.infinity
    );
  }
}