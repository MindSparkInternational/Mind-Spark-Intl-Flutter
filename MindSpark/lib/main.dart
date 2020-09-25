import 'package:MindSpark/articlePage.dart';
import 'package:MindSpark/createPost.dart';
import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/drawerStack.dart';
import 'package:provider/provider.dart';
import 'package:MindSpark/homeheader.dart';
import 'package:MindSpark/models/postModel.dart';
import 'package:MindSpark/signAndLogStuff/signUp.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signAndLogStuff/loginOrSign.dart';

import 'package:MindSpark/onboardings/onboarding.dart';
import 'package:MindSpark/splashScreen.dart';
import 'package:MindSpark/testFiles/videoUploadTest.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home.dart';
import 'signAndLogStuff/loginScreen.dart';
import 'profile.dart';
import 'create.dart';

main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");
  runApp(
    new MultiProvider(providers: 
    [
      ListenableProvider<PostModel>(create: (_) => PostModel()),
    ],
    child:
        new MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: new MyApp(),
        home: Splash()
        //home: email == null ? Login() : MyApp()
        //home: FilePickerDemo()
        //home: Splash()
        //home: HomePage()
        //home: OnboardingScreen()
        //home:SignUp()

      )
    )
    );
   

}



class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();

}

class _MyAppState extends State<MyApp>{
  int _currentIndex = 0;
  bool check = true;
  
    
  final List<Widget> children = [
    
    new DrawerStack(),
    //new Create(),
    //new CreatePost(),
    new Profile()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Home();
    
    
  }

  // Widget float1() {
  //   return FloatingActionButton(
  //     shape: CircleBorder(),
  //     onPressed: (){
  //       print("hi");
  //       Navigator.of(context).push(_createRoute());
  //     },
  //     backgroundColor: Colors.green,
  //     heroTag: 'btn3',
  //     tooltip: 'Second button',
  //     child: Icon(Icons.list),
  //   );
  // }

  // Widget float2() {
  //   return FloatingActionButton(
  //     onPressed: (){
  //       print("hi");
  //       Navigator.of(context).push(_createRoute());
  //     },
  //     heroTag: 'btn4',
  //     tooltip: 'First button',
  //     backgroundColor: Colors.red,
  //     child: Icon(Icons.image),
  //   );
  // }

  // Widget float3() {
  //   return FloatingActionButton(
  //     backgroundColor: Colors.yellow,
  //     heroTag: 'btn2',
  //     child: Icon(Icons.play_arrow,),
  //     onPressed: () => Navigator.of(context).push(_createRoute()),
  //   );
  // }
  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => Create(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(0.0, 1.0);
  //       var end = Offset.zero;
  //       var curve = Curves.ease;

  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }
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