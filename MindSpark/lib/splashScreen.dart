import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/main.dart';
import 'package:MindSpark/models/postModel.dart';
import 'package:MindSpark/signAndLogStuff/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _controller.repeat(reverse: true);
    getAllData(context);
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("19222c"),
      body:  
        Center(
          child: 
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: 
                Container(
                  height: 175,
                  width: 175,
                  child: Image.asset("assets/img/MindSpark.png"),
                ),
              ),
              
              Align(
                alignment: Alignment.center,
                child: 
                Container(
                    height: 175,
                    width: 175,
                    child: Shimmer.fromColors(
                      child: Image.asset("assets/img/MindSparkBolt.png"), 
                      baseColor: Hexcolor("f3d266"), 
                      highlightColor: Hexcolor("FFFFFF")
                      ),
                  ),
              ),
            ],
          )
      )
    );
  }
  void startTimer() {
    Timer(Duration(milliseconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }
    void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(),));
    }
  }

   Future<void> secondPostData(BuildContext context) async{
     Provider.of<PostModel>(context,listen: false).setList(await fetchPostData(context));
   }
   Future<List<Post>> fetchPostData(BuildContext context) async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
       String token = preferences.get("token");
       List<Post> list = new List();
       print(token);
       var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/posts/create/", headers: {
         "Authorization":"$token" 
         }
       );
       var responseBody = json.decode(response.body);
       print('responseBodyHome type is ${responseBody.runtimeType}');
       print('responseBodyHome length is ${responseBody.length}');
       print("hi");
       for(Map map in responseBody){
         var thing = Post.fromJson(map);
         print('thing type is ${thing.runtimeType}');
         list.add(Post.fromJson(map as Map<String, dynamic>));
         print("hello");
       }
       print(list.length);
       print(list[0].title);
       //var listy = (responseBod as List).map((t) => Post.fromJson(responseBod)).toList();
       print(json.decode(response.body));
       return list;
   }

   void getAllData(BuildContext context) async{
     await secondPostData(context);
   }
}