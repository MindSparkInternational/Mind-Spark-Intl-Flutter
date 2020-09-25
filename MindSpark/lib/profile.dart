import 'package:MindSpark/components/ArticleCard.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:MindSpark/dataClasses/user.dart';
import 'package:MindSpark/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:page_transition/page_transition.dart';
import 'SizeConfig.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'components/PostCard.dart';
import 'articlePage.dart';
import 'dataClasses/post.dart';
import 'generalsetting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> user;
  @override
  void initState() {
    super.initState();
    user = getUserData();
  }

  Future<User> getUserData() async {
    User user;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/auth/user/",
      headers: {"Authorization":"$token"},
    );
    var responseBody = json.decode(response.body);
    print("I am her");
    for(Map map in responseBody){
      var thing = Post.fromJson(map);
      print('thing author type is ${thing.runtimeType}');
      user = User.fromJson(map as Map<String, dynamic>);
      print("hello");
    }

    print(response);
    return user;
    //return token;
  }

  final controller = PageController(
    initialPage: 0,
  );

  //bool dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: user,
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return CircularProgressIndicator();
            print("broke");
            break;
          case ConnectionState.active:
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.done:
            //print("Real author ${snapshot.data.firstName}"); 
            return DefaultTabController(
              length: 2,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Hexcolor('#E5E5E5'),
                  body: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  color: Hexcolor('#FBD772'),
                                  child: Container(
                                      child: Column(
                                    children: [
                                      Container(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10.0,
                                                          top: 10,
                                                          right: 15),
                                                      child: Container(
                                                        child: ClipOval(
                                                          child: Container(
                                                            height: 60,
                                                            width: 60,
                                                            child: Image.network(
                                                              'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg',
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'John Doe(Full Name)',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Lover of science(Username)',
                                                          style:
                                                              TextStyle(fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Container(
                                                      child: InkWell(
                                                    child: Icon(
                                                      Icons.settings,
                                                      color: Colors.white,
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProfieSettings()));
                                                    },
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                      Container(
                                        padding: EdgeInsets.only(left: 80),
                                        child: Row(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                ),
                                                onPressed: () {},
                                                color: Colors.white,
                                                textColor: Colors.black,
                                                child: Text("Pioneer",
                                                    style: TextStyle(fontSize: 14)),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.only(left: 30)),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(20.0),
                                                  ),
                                                  onPressed: () {},
                                                  textColor: Colors.white,
                                                  child: Text("Another Role",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black)),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 30, right: 6),
                                        child: TextField(
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: 15.0, color: Colors.white),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter About yourself',
                                            hintStyle: TextStyle(
                                              color: Colors.white,
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                            contentPadding: const EdgeInsets.only(
                                                left: 14.0, bottom: 6.0, top: 8.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Hexcolor("#60aaa1"),
                                              ),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Row(children: <Widget>[
                                        Padding(padding: EdgeInsets.only(left: 40)),
                                        _getIconName(
                                            icon: Icons.link, title: 'www.example.com'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        _getIconName(
                                            icon: Icons.location_on, title: 'Country '),
                                      ])),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Expanded(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Hexcolor('#1F415F'),
                                                        border: Border.all(
                                                          color: Hexcolor("#60aaa1"),
                                                        ),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10.0))),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text("577",
                                                            style: TextStyle(
                                                                color: Colors.white)),
                                                        FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            'Followers',
                                                            style: TextStyle(
                                                                color: Colors.white),
                                                          ),
                                                        )
                                                      ],
                                                    ))),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Expanded(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Hexcolor('#1F415F'),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10.0))),
                                                    child: Column(children: <Widget>[
                                                      Text("577",
                                                          style: TextStyle(
                                                              color: Colors.white)),
                                                      FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          'Following',
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                      )
                                                    ]))),
                                            Padding(padding: EdgeInsets.only(left: 10)),
                                            Expanded(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Hexcolor("#1f405e"),
                                                        border: Border.all(
                                                          color: Hexcolor("#60aaa1"),
                                                        ),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10.0))),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text("8",
                                                              style: TextStyle(
                                                                  color: Colors.white)),
                                                          FittedBox(
                                                            fit: BoxFit.fitWidth,
                                                            child: Text(
                                                              'Publications',
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  color: Colors.white),
                                                            ),
                                                          )
                                                        ]))),
                                            Padding(padding: EdgeInsets.only(left: 5)),
                                            Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Hexcolor("#1f405e"),
                                                      border: Border.all(
                                                        color: Hexcolor("#60aaa1"),
                                                      ),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10.0))),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text("577",
                                                            style: TextStyle(
                                                                color: Colors.white)),
                                                        FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            'Bolts',
                                                            style: TextStyle(
                                                                color: Colors.white),
                                                          ),
                                                        )
                                                      ])),
                                            ),
        //  Padding(padding: EdgeInsets.only(left: 5)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                                ),
                                TabBar(
                                    indicatorColor: Colors.black,
                                    indicatorWeight: 0.3,
                                    labelColor: Colors.black,
                                    tabs: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.tag_faces),
                                          Text('My Content')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.bookmark),
                                          Text('SavedPosts')
                                        ],
                                      ),
                                    ])
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                                children: [MyArticlesTab(), MyPostsTab(constraints)]),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            );
            
          default:
          return Text("Done");
        }
      }
    );
  }
}
class MyArticlesTab extends StatefulWidget {
  @override
  _MyArticlesTabState createState() => _MyArticlesTabState();
}

class _MyArticlesTabState extends State<MyArticlesTab> {
  Future<String> response;
  String author;
  String title;
  String decode;
  Map<String, dynamic> responseJson;
  Future<List<Post>> post;
  @override
  void initState() { 
    super.initState();
    // response = getData().then((value){
    //   //String decode = response as String;
    //   //final Map<String, dynamic> responseJson = json.decode(decode);
    //   setState(() {
    //     decode = value;
    //   });
      
    // }).whenComplete(() {
    //   print(decode);
    //   responseJson = json.decode(decode);
    //   author = responseJson["author"];
    //   print(author);
    // });
    post = getData();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: post,
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return CircularProgressIndicator();
            print("broke");
            break;
          case ConnectionState.active:
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.done:
            print("Real author ${snapshot.data[0].author}");
            return LayoutBuilder(builder: (context, constraints) {
            double maxHeight = constraints.maxHeight;
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  String title = snapshot.data[index].title;
                  String body = snapshot.data[index].body;
                  String author = snapshot.data[index].author;
                  int likes = snapshot.data[index].likes;
                  List<dynamic> fields = snapshot.data[index].fields;
                  return Container(height: maxHeight,child: MyCard2(title: title, body: body, author: author,fields: fields,likes: likes,));
                }
              )
              // ListView(
              //   children: <Widget>[
              //     Container(height: maxHeight, child: MyCard2()),
              //     Container(height: maxHeight, child: ArticleCard()),
              //     Container(height: maxHeight, child: ArticleCard()),
              //     //Container(height: maxHeight, child: ArticleCard()),
              //   ],
              // ),
            );
          });
            print("done");
            break;
          default:
      //return CircularProgressIndicator();
          return LayoutBuilder(builder: (context, constraints) {
            double maxHeight = constraints.maxHeight;
            return Container(
              child: ListView(
                children: <Widget>[
                  Container(height: maxHeight, child: ArticleCard()),
                  Container(height: maxHeight, child: ArticleCard()),
                  Container(height: maxHeight, child: ArticleCard()),
                  //Container(height: maxHeight, child: ArticleCard()),
                ],
              ),
            );
          });
        }
      }
    );
  }
  Future<List<Post>> getData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.get("token");
    List<Post> list = new List();
    print(token);
    var response = await http.get("https://mindsparkapi.herokuapp.com/api/v1/posts/create/", headers: {
      "Authorization":"$token" 
      }
    );
    var responseBody = json.decode(response.body);
    print('responseBody type is ${responseBody.runtimeType}');
    print('responseBody length is ${responseBody.length}');
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
}


class MyPostsTab extends StatelessWidget {
  MyPostsTab(this.constraints);
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(height: constraints.maxHeight * 0.65, child: ArticleCard()),
          Container(height: constraints.maxHeight * 0.65, child: ArticleCard()),
          Container(height: constraints.maxHeight * 0.65, child: ArticleCard()),
          Container(height: constraints.maxHeight * 0.65, child: ArticleCard()),
        ],
      ),
    );
  }
}

//#60aaa1
Widget _getIconName({String title, IconData icon}) {
  return Container(
      child: Row(children: [
    Icon(
      icon,
      size: 22.0,
      color: Hexcolor("#60aaa1"),
    ),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(title, style: TextStyle(fontSize: 14.0, color: Colors.white)),
    )
  ]));
}

class HeroDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FBD772'),
      appBar: AppBar(
        backgroundColor: Hexcolor("#19222c"),
        title: Text('Your Profile Picture'),
      ),
      body: Container(
          child: Center(
              child: Hero(
        tag: 'myImage',
        child: ClipOval(
          child: new SizedBox(
            width: 200.0,
            height: 200.0,
            child: Image.network(
              'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ))),
    );
  }
}

class Pagetwo extends StatefulWidget {
  @override
  _PagetwoState createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: PageView(
            children: [
              ArticleCard(),
              MyCard2(),
              ArticleCard(),
              MyCard2(),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Hexcolor("#60aaa1"),
          overlayColor: Colors.transparent,
          foregroundColor: Hexcolor("#1f405e"),
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 20.0),
          onOpen: () => print('OPENING DIAL'),
          children: [
            SpeedDialChild(
              child: Icon(Icons.thumb_up, color: Colors.white),
              backgroundColor: Hexcolor("#1f405e"),
              label: 'Likes ',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Hexcolor("#1f405e"),
            ),
            SpeedDialChild(
              child: Icon(Icons.share, color: Colors.white),
              backgroundColor: Hexcolor("#1f405e"),
              label: 'Share ',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Hexcolor("#1f405e"),
            ),
            SpeedDialChild(
              child: Icon(Icons.subject, color: Colors.white),
              backgroundColor: Hexcolor("#1f405e"),
              label: 'Field ',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Hexcolor("#1f405e"),
            ),
            SpeedDialChild(
              child: Icon(Icons.video_library, color: Colors.white),
              backgroundColor: Hexcolor("#1f405e"),
              label: 'Type ',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Hexcolor("#1f405e"),
            ),
          ],
        ),
      ),
    );
  }
}