import 'package:flutter/material.dart';


class SignUpThree extends StatefulWidget {
  @override
  _SignUpThreeState createState() => _SignUpThreeState();
}

class _SignUpThreeState extends State<SignUpThree> {
  List<DateTime> getHighlightedDates() {
    return List<DateTime>.generate(
      10,
      (int index) => DateTime.now().add(Duration(days: 10 * (index + 1))),
    );
  }
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
      ),
    );
  }
}