import 'package:MindSpark/components/ArticleCard.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/dataClasses/diffUser.dart';
import 'package:MindSpark/home.dart';
import 'package:MindSpark/models/postModel.dart';
import 'package:MindSpark/models/userModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'SizeConfig.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'animations/FadeAnimation.dart';
import 'components/PostCard.dart';
import 'articlePage.dart';
import 'generalsetting.dart';
import 'package:http/http.dart' as http;
import 'package:MindSpark/components/CommentBox.dart';
import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/home.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/animations/FadeAnimation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:MindSpark/components/EngageMentComponents.dart';
import 'package:MindSpark/components/CommentBox.dart';
import 'package:page_transition/page_transition.dart';


class SecondProfile extends StatefulWidget {
  DiffUser diffUser;
  SecondProfile({this.diffUser});
  @override
  _SecondProfileState createState() => _SecondProfileState(diffUser: diffUser);
}

class _SecondProfileState extends State<SecondProfile> {
  DiffUser diffUser;
  bool isFollowed = false;
  _SecondProfileState({this.diffUser});
  @override
  void initState() {
    // TODO: implement
    getToken();
    super.initState();
  }

  void getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    //return token;
  }

  final controller = PageController(
    initialPage: 0,
  );

  //bool dialVisible = true;
  @override
  Widget build(BuildContext context) {
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
                                   "${diffUser.user.firstName} ${diffUser.user.lastName} ",
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
                                child: diffUser.user.rolesList != null ? 
                                Container(
                                  height: 30,
                                  width: constraints.maxWidth,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: diffUser.user.rolesList.length,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.symmetric(),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          onPressed: () {
                                            print("${Provider.of<UserModel>(context, listen:true).user.firstName}");
                                          },
                                          color: Colors.white,
                                          textColor: Colors.black,
                                          child: Text("${diffUser.user.rolesList[index]}",
                                              style: TextStyle(fontSize: 14)),
                                        )
                                      );
                                    }
                                  )
                                )
                                // Row(
                                //   children: <Widget>[
                                //     Align(
                                //       alignment: Alignment.topLeft,
                                //       child: FlatButton(
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(20.0),
                                //         ),
                                //         onPressed: () {
                                //           print("${Provider.of<UserModel>(context, listen:true).user.firstName}");
                                //         },
                                //         color: Colors.white,
                                //         textColor: Colors.black,
                                //         child: Text("${Provider.of<UserModel>(context, listen:true).user.roles}",
                                //             style: TextStyle(fontSize: 14)),
                                //       ),
                                //     ),
                                //     Padding(padding: EdgeInsets.only(left: 30)),
                                //     Align(
                                //         alignment: Alignment.topRight,
                                //         child: RaisedButton(
                                //           color: Colors.white,
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(20.0),
                                //           ),
                                //           onPressed: () {},
                                //           textColor: Colors.white,
                                //           child: Text("Another Role",
                                //               style: TextStyle(
                                //                   fontSize: 14,
                                //                   color: Colors.black)),
                                //         ))
                                //   ],
                                // ):
                                :Container()
                                ,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:20 ),
                                child: Align(alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    child: Container(
                                    padding: EdgeInsets.all(10),
                                    child:
                                     Text("Enter About yourself ",textAlign: TextAlign.center,style: TextStyle(
                                       
                                     ),)
                                    //   autofocus: false,
                                    //   style: TextStyle(
                                    //       fontSize: 15.0, color: Colors.white),
                                    //   decoration: InputDecoration(
                                    //     border: InputBorder.none,
                                    //     hintText: 'Enter About yourself',
                                    //     hintStyle: TextStyle(
                                    //       color: Colors.white,
                                    //     ),
                                    //     filled: true,
                                    //     fillColor: Colors.transparent,
                                    //     contentPadding: const EdgeInsets.only(
                                    //         left: 14.0, bottom: 6.0, top: 8.0),
                                    //     focusedBorder: OutlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //         color: Hexcolor("#60aaa1"),
                                    //       ),
                                    //       borderRadius: BorderRadius.circular(10.0),
                                    //     ),
                                    //     enabledBorder: UnderlineInputBorder(
                                    //       borderSide:
                                    //           BorderSide(color: Colors.grey),
                                    //       borderRadius: BorderRadius.circular(10.0),
                                    //     ),
                                    //   ),
                                    // ),
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
                                padding: EdgeInsets.all( 5),
                                child: Row(
                                  children: <Widget>[
                                   // Padding(padding: EdgeInsets.only(left: 10)),
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Hexcolor('#1F415F'),
                                                border: Border.all(
                                                //  color: Hexcolor("#60aaa1"),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            child: Column(
                                              children: <Widget>[
                                    Text("${diffUser.followers}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    'Followers',
                                                    style: TextStyle(
                                                        color: Colors.white,fontWeight: FontWeight.bold),
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
                              Text("${diffUser.followers}",
                                                  style: TextStyle(
                                                      color: Colors.white,fontWeight: FontWeight.bold)),
                                              FittedBox(
                                                //fit: BoxFit.fitWidth,
                                                child: Text(
                                                  'Following',
                                                  style: TextStyle(
                                                      color: Colors.white,fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ]))),
                                    Padding(padding: EdgeInsets.only(left: 10)),
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Hexcolor("#1f405e"),
                                                border: Border.all(
                                                 // color: Hexcolor("#60aaa1"),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("0",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  FittedBox(
                                                   // fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      'Publications',
                                                      style: TextStyle(
                                                          //fontSize: 22,
                                                          color: Colors.white,fontWeight: FontWeight.bold),
                                                    ),
                                                  )
                                                ]))),
                                   //  Padding(padding: EdgeInsets.only(left: 10)),
                                    // Expanded(
                                    //   child: Container(
                                    //       decoration: BoxDecoration(
                                    //           color: Hexcolor("#1f405e"),
                                    //           border: Border.all(
                                    //             color: Hexcolor("#60aaa1"),
                                    //           ),
                                    //           borderRadius: BorderRadius.all(
                                    //               Radius.circular(10.0))),
                                    //       child: Column(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.start,
                                    //           children: <Widget>[
                                    //             Text("577",
                                    //                 style: TextStyle(
                                    //                     color: Colors.white)),
                                    //             FittedBox(
                                    //               fit: BoxFit.fitWidth,
                                    //               child: Text(
                                    //                 'Bolts',
                                    //                 style: TextStyle(
                                    //                     color: Colors.white),
                                    //               ),
                                    //             )
                                    //           ])
                                    //           ),
                                    // ),
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
                        children: [MyArticlesTab(diffUser:diffUser, constraints: constraints), MyPostTab(diffUser:diffUser, constraints: constraints),]),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MyArticlesTab extends StatefulWidget {
  String title;
  String author;
  String body;
  List<dynamic> fields;
  List<Comment> comments;
  BoxConstraints constraints;
  DiffUser diffUser;
  int likes;
  String date;
  MyArticlesTab({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.diffUser, this.constraints});
  @override
  _MyArticlesTabState createState() => _MyArticlesTabState(diffUser:diffUser, constraints: constraints);
}

class _MyArticlesTabState extends State<MyArticlesTab> {
 String title;
  String author;
  String body;
  String date;
  int likes;
  DiffUser diffUser;
  List<dynamic> fields;
  List<Comment> comments;
  BoxConstraints constraints;
  _MyArticlesTabState({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.diffUser, this.constraints});
  @override
  Widget build(BuildContext context) {
    double maxHeight = constraints.maxHeight;
    return LayoutBuilder(builder: (context, constraints) {
      
      return 
         Container(height: maxHeight , 
        child:  
        Consumer<UserModel>(builder: (context, postModel, child) {

       return   
       diffUser.posts == null ?
        Container(child:Text("Hello")):
        Container(
          height: maxHeight,
          child: 
          ListView.builder(
            itemCount: diffUser.posts.length,
            itemBuilder: (context, index){
              String author = diffUser.posts[index].author;
              print("aa$author");
              String title = diffUser.posts[index].title;
              String body = diffUser.posts[index].body;
              DiffUser diffUserSecond = diffUser.posts[index].diffUser;
              int likes = diffUser.posts[index].likes;
              List<dynamic> fields = diffUser.posts[index].fields;
              String date = diffUser.posts[index].date;
              List<Comment> comments = diffUser.posts[index].finalComments;
              List<dynamic> medias = diffUser.posts[index].medias;
              String id = diffUser.posts[index].id;
              print("comment size ${comments}");
              return Container(height: maxHeight ,
              child:
              MyCard2(diffUser: diffUserSecond,title: title, author: author, body: body, fields: fields,  date: date, comments: comments, id: id,medias: medias,likes:likes)
              );
            }
          )
        );
    },));
    });
  }
}
class MyPostTab extends StatefulWidget {
  String title;
  String author;
  String body;
  List<dynamic> fields;
  List<Comment> comments;
  DiffUser diffUser;
  int likes;
  String date;
  BoxConstraints constraints;
  MyPostTab({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.diffUser, this.constraints});
  @override
  _MyPostTabState createState() => _MyPostTabState(diffUser:diffUser, constraints: constraints);
}

class _MyPostTabState extends State<MyPostTab> {
  String title;
  String author;
  String body;
  String date;
  int likes;
  DiffUser diffUser;
  BoxConstraints constraints;
  List<dynamic> fields;
  List<Comment> comments;
  _MyPostTabState({this.constraints,this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.diffUser});
  @override
  Widget build(BuildContext context) {
    double maxHeight = constraints.maxHeight;
    return LayoutBuilder(builder: (context, constraints) {
      return 
         Container(height: maxHeight , 
        child:  
        Consumer<UserModel>(builder: (context, postModel, child) {

       return   
       diffUser.articles == null ?
       Container(child:Text("Hello")):
        Container(
          height: maxHeight,
          child: 
          ListView.builder(
            itemCount: diffUser.articles.length,
            itemBuilder: (context, index){
              String author = diffUser.articles[index].author;
              print("aa$author");
              String title = diffUser.articles[index].title;
              String body = diffUser.articles[index].body;
              int likes = diffUser.articles[index].likes;
              List<dynamic> fields = diffUser.articles[index].fields;
              String date = diffUser.articles[index].date;
              List<Comment> comments = diffUser.articles[index].finalComments;
              List<dynamic> medias = diffUser.articles[index].medias;
              String id = diffUser.articles[index].id;
              String subhead = diffUser.articles[index].subHead;
              print("comment size ${comments}");
              return Container(height: maxHeight ,
              child:
              ArticleCard(subHead: subhead,title: title, author: author, body: body, fields: fields,  date: date, comments: comments, id: id,medias: medias,likes:likes)
              );
            }
          )
        );
    },));
    });
  }
}


class Example extends StatefulWidget {
  String title;
  String author;
  String body;
  List<dynamic> fields;
  List<Comment> comments;
  String date;
  Example({this.title, this.author, this.body, this.fields,  this.date, this.comments});
  @override
  _ExampleState createState() => _ExampleState(title: title, author: author, body: body, fields: fields, comments:comments,  date: date);
}

class _ExampleState extends State<Example> {
  String title;
  String author;
  String body;
  String date;
  int likes;
  List<Comment> comments;
List<dynamic> fields;
  _ExampleState({this.title, this.author, this.body, this.fields, this.comments, this.date});
  String sampletext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  bool showFullCaption = false;
  bool isTapped = false;
  bool commentTapped = false;
  
 

  @override
  Widget build(BuildContext context) => FadeAnimation(0.25, LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
          //  print(date);
        return Container(
          child: Container(
            decoration: BoxDecoration(
                color: Hexcolor('#E5E5E5'),
                borderRadius: BorderRadius.circular(3)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Hexcolor('#FBD772'),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 1, left: 8, right: 8),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child: Icon(Icons.face),
                                                  radius: 15,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      author,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                child: Container(
                                                    child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Text(
                                                date.substring(0, date.indexOf("T")),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          width: constraints.maxWidth * 0.9,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Image.asset(
                                              'assets/img/Image1.png',
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2.0,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [Text('Share')],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.comment),
                                                    Text('Comment')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.bookmark),
                                                    Text('Save')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    PostTags(name: "text"),
                                                    PostTags(name: "text"),
                                                    PostTags(name: "text"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    LikesBar(likes: likes,),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    SaveBar()
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          showFullCaption
                              ? Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showFullCaption = false;
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SingleChildScrollView(
                                              child: Text(
                                           '$body',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                left: 8,
                                                right: 8),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  showFullCaption = true;
                                                });
                                              },
                                              child: Container(
                                                height: constraints.maxHeight *
                                                    0.15,
                                                width: constraints.maxWidth,
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      '$body',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2, left: 8, right: 8),
                                            child: Container(
                                                height: constraints.maxHeight *
                                                    0.15,
                                                width: constraints.maxWidth,
                                                child: ListView(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print("made it two");
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                child: PostCommentScreen(
                                                                    comments),
                                                                type: PageTransitionType
                                                                    .downToUp));
                                                       },
                                                      child: Text(comments == null ? "No Comments":"View ${comments.length} Comments",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                   comments == null ?CommentBox(caption:"No Comments", author: "",):CommentBox(caption:comments[0].content, author: comments[0].author,),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }));
}


class SavedScreen extends StatefulWidget {
  SavedScreen({this.constraints});
  final BoxConstraints constraints;
  
  @override
  _SavedScreenState createState() => _SavedScreenState(constraints: constraints);
}

class _SavedScreenState extends State<SavedScreen> {
  final BoxConstraints constraints;
  _SavedScreenState({this.constraints});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight,
      color: Hexcolor('#E5E5E5'),
      child: Consumer<UserModel>(
        builder: (context, savedModel, child){
          return new ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: savedModel.extraUser.bookmarks.length,
            itemBuilder: (context, index){
              String id = savedModel.extraUser.bookmarks[index].id;
              String author = savedModel.extraUser.bookmarks[index].author;
              String title = savedModel.extraUser.bookmarks[index].title;
              String subHead = savedModel.extraUser.bookmarks[index].subHead;
              String body = savedModel.extraUser.bookmarks[index].body;
              int likes = savedModel.extraUser.bookmarks[index].likes;
              List<dynamic> fields = savedModel.extraUser.bookmarks[index].fields;
              String date = savedModel.extraUser.bookmarks[index].date;
              List<Comment> comments = savedModel.extraUser.bookmarks[index].finalComments;
              List<dynamic> medias =  savedModel.extraUser.bookmarks[index].medias;
              return 
              Container(
                height: constraints.maxHeight,
                child: ArticleCard(author: author, title: title, body: body, likes: likes, comments: comments, date:date ,fields: fields,subHead: subHead, medias: medias, id:id)
              );
              
            },
          );
        },
      )
    );
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
          Container(height: constraints.maxHeight * 0.65, child: MyCard2()),
          Container(height: constraints.maxHeight * 0.65, child: MyCard2()),
          Container(height: constraints.maxHeight * 0.65, child: MyCard2()),
          Container(height: constraints.maxHeight * 0.65, child: MyCard2()),
        ],
      ),
    );
  }
}


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

// class HeroDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Hexcolor('#FBD772'),
//       appBar: AppBar(
//         backgroundColor: Hexcolor("#19222c"),
//         title: Text('Your Profile Picture'),
//       ),
//       body: Container(
//           child: Center(
//               child: Hero(
//         tag: 'myImage',
//         child: ClipOval(
//           child: new SizedBox(
//             width: 200.0,
//             height: 200.0,
//             child: Image.network(
//               'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg',
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//       ))),
//     );
//   }
// }

// class Pagetwo extends StatefulWidget {
//   @override
//   _PagetwoState createState() => _PagetwoState();
// }

// class _PagetwoState extends State<Pagetwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Container(
//           child: PageView(
//             children: [
//               // ArticleCard(),
//               // MyCard2(),
//               // ArticleCard(),
//               // MyCard2(),
//             ],
//           ),
//         ),
//         // floatingActionButton: SpeedDial(
//         //   backgroundColor: Hexcolor("#60aaa1"),
//         //   overlayColor: Colors.transparent,
//         //   foregroundColor: Hexcolor("#1f405e"),
//         //   animatedIcon: AnimatedIcons.menu_close,
//         //   animatedIconTheme: IconThemeData(size: 20.0),
//         //   onOpen: () => print('OPENING DIAL'),
//         //   children: [
//         //     SpeedDialChild(
//         //       child: Icon(Icons.thumb_up, color: Colors.white),
//         //       backgroundColor: Hexcolor("#1f405e"),
//         //       label: 'Likes ',
//         //       labelStyle:
//         //           TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         //       labelBackgroundColor: Hexcolor("#1f405e"),
//         //     ),
//         //     SpeedDialChild(
//         //       child: Icon(Icons.share, color: Colors.white),
//         //       backgroundColor: Hexcolor("#1f405e"),
//         //       label: 'Share ',
//         //       labelStyle:
//         //           TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         //       labelBackgroundColor: Hexcolor("#1f405e"),
//         //     ),
//         //     SpeedDialChild(
//         //       child: Icon(Icons.subject, color: Colors.white),
//         //       backgroundColor: Hexcolor("#1f405e"),
//         //       label: 'Field ',
//         //       labelStyle:
//         //           TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         //       labelBackgroundColor: Hexcolor("#1f405e"),
//         //     ),
//         //     SpeedDialChild(
//         //       child: Icon(Icons.video_library, color: Colors.white),
//         //       backgroundColor: Hexcolor("#1f405e"),
//         //       label: 'Type ',
//         //       labelStyle:
//         //           TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         //       labelBackgroundColor: Hexcolor("#1f405e"),
//         //     ),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }