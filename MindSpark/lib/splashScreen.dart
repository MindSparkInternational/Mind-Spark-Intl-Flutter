import 'dart:async';
import 'dart:convert';
import 'package:MindSpark/dataClasses/article.dart';
import 'package:MindSpark/dataClasses/diffUser.dart';
import 'package:MindSpark/dataClasses/extraUser.dart';
import 'package:MindSpark/dataClasses/user.dart';
import 'package:MindSpark/home.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/models/articleModel.dart';
import 'package:MindSpark/models/userModel.dart';
import 'package:MindSpark/onboardings/onboarding.dart';
import 'package:MindSpark/signAndLogStuff/loginOrSign.dart';
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
    
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/assets/image0.png"), context);
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
    Timer(Duration(milliseconds: 1), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }
    void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("hi there");

    
    var checkOnboard = prefs.getInt("checkOnboard");
    print("checkOnboard $checkOnboard");
    //prefs.remove("email");
    var email = prefs.getString("email");
    print("This is an email ${prefs.getString("email")}");
    // if(checkOnboard == 1){
    //   prefs.setInt("checkOnboard", 2);
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingScreen(),));
    // }
    if (email == null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
    } else {
      await getAllData(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));
    }
    
  }

  Future<void> secondPostData(BuildContext context) async{
    Provider.of<ArticleModel>(context,listen: false).setList(await fetchAricleData(context));
    Provider.of<PostModel>(context,listen: false).setList(await fetchPostData(context));
    Provider.of<UserModel>(context,listen: false).setUser(await getUserData(context));
    Provider.of<UserModel>(context,listen: false).setExtraUser(await getExtraUserData(context));
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
      print("MADE IT HERE WOW");
      for(Post post in list){
        List<Comment> commentList = new List();
        var responseComment = await http.get("https://mindsparkapi.herokuapp.com/api/v1/posts/comment/?post_id=${post.id}", headers: {
          "Authorization":"$token",
          }
        );
        var responseBodyComment = json.decode(responseComment.body);
        for(Map map in responseBodyComment){
          commentList.add(Comment.fromJson(map as Map<String, dynamic>));
        }
        post.finalComments = commentList;
        //print("Post comment content ${post.finalComments[0].author} ${post.title}");
      }
      print("made it here");
      //var listy = (responseBod as List).map((t) => Post.fromJson(responseBod)).toList();
      print(json.decode(response.body));
      return list;
  }

  Future<List<Article>> fetchAricleData(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     String token = preferences.get("token");
      
      List<Article> list = new List();
      print("$token");
      var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/articles/get/", headers: {
        "Authorization":"$token" 
        }
      );
      var responseBody = json.decode(response.body);
      print('responseBodyHome type is ${responseBody.runtimeType}');
      print('responseBodyHome length is ${responseBody.length}');
      print("$responseBody");
      print("hi");
      for(Map map in responseBody){
        var thing = Article.fromJson(map);
        print('thing type is ${thing.runtimeType}');
        list.add(Article.fromJson(map as Map<String, dynamic>));
        print("hello");
      }
      for(Article article in list){
        List<Comment> commentList = new List();
        var responseComment = await http.get("https://mindsparkapi.herokuapp.com/api/v1/articles/comment/?article_id=${article.id}", headers: {
          "Authorization":"$token",
          }
        );
        var responseBodyComment = json.decode(responseComment.body);
        for(Map map in responseBodyComment){
          commentList.add(Comment.fromJson(map as Map<String, dynamic>));
        }
        article.finalComments = commentList;
        print("AUTHOR ID FROM ARTICLE${article.authorId}");
        var diffUserResponse = await http.get(
          "https://mindsparkapi.herokuapp.com/api/v1/users/props?user_id=${article.authorId}",
          headers: {
            "Authorization": "$token"
          }
        );
        
        DiffUser user;
        var diffUserResponseBody = json.decode(diffUserResponse.body);
        print(diffUserResponseBody);
        print("CHECKPOINT FOR DIFF USER");
        user = DiffUser.fromJson(diffUserResponseBody as Map<String, dynamic>);
        article.diffUser = user;
        print("Article splash comment length ${article.finalComments.length}");
        //print("Post comment content ${post.finalComments[0].author} ${post.title}");
      }
      print("$list.length");
      print("$list[0].title");
      // for(Article article in list){
      //   List<Comment> commentList = new List();
      //   var responseComment = await http.get("https://mindsparkapi.herokuapp.com/api/v1/posts/comment/?post_id=${article.id}", headers: {
      //     "Authorization":"$token",
      //     }
      //   );
      //   var responseBodyComment = json.decode(responseComment.body);
      //   for(Map map in responseBodyComment){
      //     commentList.add(Comment.fromJson(map as Map<String, dynamic>));
      //   }
      //   article.finalComments = commentList;
      //   print("Post comment content ${article.finalComments[0].author} ${article.title}");
      // }
      //var listy = (responseBod as List).map((t) => Post.fromJson(responseBod)).toList();
      print(json.decode(response.body));
      return list;
  }
  Future<User> getUserData(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/auth/user/", headers: {
        "Authorization":"$token" 
        }
      );
    print("Made it past api call");
    var responseBody = json.decode(response.body);
    print("USER BODY$responseBody");
    User user = User.fromJson(responseBody);
    preferences.setString("user_id", user.id);
    print(user.age);
    return user;
    
  }
  Future<ExtraUser> getExtraUserData(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    String userId = preferences.getString("user_id");
    // String token = 'Token 713be29dfbca9a93134a5672718e725b5b9bff54';
    var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/users/props?user_id=${userId}", headers: {
        "Authorization":"$token" 
        }
      );
    print("Made it past api call");
    var responseBody = json.decode(response.body);
    print("USER BODY36$responseBody");
    ExtraUser user = ExtraUser.fromJson(responseBody);
    print("THIS IS A PARSE CHECK ${user.userFull.firstName}");

    return user;
    
  }


   Future<void> getAllData(BuildContext context) async{
     await secondPostData(context);
   }
}