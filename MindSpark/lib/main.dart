import 'package:MindSpark/articlePage.dart';
import 'package:MindSpark/createPost.dart';
import 'package:MindSpark/drawerStack.dart';
import 'package:MindSpark/filterDashLayout.dart';
import 'package:MindSpark/homeheader.dart';
import 'package:MindSpark/signAndLogStuff/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signAndLogStuff/loginOrSign.dart';

import 'package:MindSpark/onboardings/onboarding.dart';
import 'package:MindSpark/splashScreen.dart';
import 'package:MindSpark/testFiles/videoUploadTest.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nice_button/NiceButton.dart';
import 'home.dart';
import 'signAndLogStuff/loginScreen.dart';
import 'profile.dart';
import 'create.dart';
main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: new MyApp(),
    home: email == null ? Login() : MyApp()
    //home: FilePickerDemo()
    //home: Splash()
    //home: HomePage()
    //home: OnboardingScreen()
    //home:SignUp()

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
    //new CreatePost(),
    new Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor("60aaa1"),
        child: Icon(Icons.add),
        onPressed: () async {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost(),));
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.remove("email");
          
        },
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
      heroTag: 'btn4',
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