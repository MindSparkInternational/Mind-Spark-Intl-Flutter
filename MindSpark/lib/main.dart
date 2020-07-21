import 'package:MindSpark/articlePage.dart';
import 'package:MindSpark/drawerStack.dart';
import 'package:MindSpark/filterDashLayout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'home.dart';
import 'package:awesome_speed_dial/awesome_speed_dial.dart';
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
    //new Create(),
    new Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: AwesomeSpeedDial(
        fabButtons: <Widget>[float1(), float2(), float3()],
        colorStartAnimation: Colors.purple,
        colorEndAnimation: Colors.purple,
        animatedIconData: AnimatedIcons.add_event,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  
      bottomNavigationBar: CurvedNavigationBar(
      
        color: Colors.black87,
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.black12,
        height: 40,
      
        animationCurve: Curves.decelerate,
        items: <Widget>[
          Icon(Icons.home, size: 25, color: Colors.black),
          //Icon(Icons.add_circle, size: 25, color: Colors.black),
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
        body: Center(
          child: IndexedStack(
            index: _currentIndex,
            children: children,
          ),

        )
        
      );
    
  }

  Widget float1() {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: (){
        print("hi");
        Navigator.of(context).push(_createRoute());
      },
      backgroundColor: Colors.green,
      heroTag: 'btn3',
      tooltip: 'Second button',
      child: Icon(Icons.list),
    );
  }

  Widget float2() {
    return FloatingActionButton(
      onPressed: (){
        print("hi");
        Navigator.of(context).push(_createRoute());
      },
      heroTag: 'btn1',
      tooltip: 'First button',
      backgroundColor: Colors.red,
      child: Icon(Icons.image),
    );
  }

  Widget float3() {
    return FloatingActionButton(
      backgroundColor: Colors.yellow,
      heroTag: 'btn2',
      child: Icon(Icons.play_arrow,),
      onPressed: () => Navigator.of(context).push(_createRoute()),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Create(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
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
