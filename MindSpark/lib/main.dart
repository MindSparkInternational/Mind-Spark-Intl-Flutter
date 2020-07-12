import 'package:MindSpark/articlePage.dart';
import 'package:MindSpark/drawerStack.dart';
import 'package:MindSpark/filterDashLayout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'home.dart';
import 'filterDashLayout.dart';
import 'profile.dart';
import 'create.dart';
main() async {
  runApp(new MaterialApp(
    home: new MyApp(),

  ));

}


class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp>{
  int _currentIndex = 0;
  final List<Widget> children = [
    new DrawerStack(),
    new Create(),
    new Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
  
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.black12,
        height: 40,
      
        animationCurve: Curves.decelerate,
        items: <Widget>[
          Icon(Icons.home, size: 25, color: Colors.black),
          Icon(Icons.add_circle, size: 25, color: Colors.black),
          Icon(Icons.portrait, size: 25, color: Colors.black),
        ],
    
        index: _currentIndex,
        onTap: (index){
          print("Current index is $index");
          setState(() {
            _currentIndex = index;
          });
        },
        ),
        body:  IndexedStack(
        index: _currentIndex,
        children: children,
      ));
    
  }
}
class myStateless extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: MyApp()
    );
  }
}
