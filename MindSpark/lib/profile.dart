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


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    //var token = preferences.getString("token");
    //print(token);
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

_showRoleInfo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),

            // backgroundColor: Hexcolor("#0d1822"),
            backgroundColor: Color(0xffE5E5E5),
            title: Text(
              "Role Information",
              style: TextStyle(color: Colors.black),
            ),
            content: GestureDetector(
              child: Text("",
                
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {}
             ),
          );
        });
  }



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
                                   "${Provider.of<UserModel>(context, listen: true).user.firstName} ${Provider.of<UserModel>(context, listen: true).user.lastName} ",
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
                                child: Provider.of<UserModel>(context, listen:true).user.rolesList != null ? 
                                Container(
                                  height: 30,
                                  width: constraints.maxWidth,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Provider.of<UserModel>(context, listen:true).user.rolesList.length,
                                    itemBuilder: (context, index){
                                      return Container(
                                        padding: EdgeInsets.symmetric(),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          onPressed: () {
                                            _showRoleInfo(context);
                                            print("${Provider.of<UserModel>(context, listen:true).user.firstName}");
                                          },
                                          color: Colors.white,
                                          textColor: Colors.black,
                                          child: Text("${Provider.of<UserModel>(context, listen:true).user.rolesList[index]}",
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
                                                // border: Border.all(
                                                // //  color: Hexcolor("#60aaa1"),
                                                // ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            child: Column(
                                              children: <Widget>[
                                    Text("${Provider.of<UserModel>(context).extraUser.followers}",
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
                              Text("${Provider.of<UserModel>(context).extraUser.followers}",
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
                                                // border: Border.all(
                                                //  // color: Hexcolor("#60aaa1"),
                                                // ),
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
                                  Text('Saved Articles')
                                ],
                              ),
                            ])
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        children: [MyArticlesTab(constraints: constraints), SavedScreen(constraints: constraints,)]),
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
  int likes;
  String date;
   MyArticlesTab({this. constraints,this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date});
  @override
  _MyArticlesTabState createState() => _MyArticlesTabState(constraints: constraints);
}

class _MyArticlesTabState extends State<MyArticlesTab> {
  String title;
  String author;
  String body;
  String date;
  BoxConstraints constraints;
  int likes;
  List<dynamic> fields;
  List<Comment> comments;
  _MyArticlesTabState({this.constraints,this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date});
  @override
  Widget build(BuildContext context) {
    double maxHeight = constraints.maxHeight;
    return LayoutBuilder(builder: (context, constraints) {
      return 
         Container(height: maxHeight , 
        child:  
        Consumer<UserModel>(builder: (context, postModel, child) {

       return   
       postModel.extraUser.posts != null ?
         ListView.builder(
          itemCount: postModel.extraUser.posts.length,
          itemBuilder: (context, index){
            print("TOTAL LENGTH ${postModel.extraUser.posts.length}");
            String author = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].author;
            String title = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].title;
            String id = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].id;
            String body = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].body;
            int likes = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].likes;
            List<dynamic> fields = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].fields;
            List<dynamic> medias = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].medias;
            String date = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].date;
            List<Comment> comments = Provider.of<UserModel>(context, listen: true).extraUser.posts[index].finalComments;
            //print("comment size ${comments.length}");
            print("aa$comments");
            return Container(height: maxHeight ,
            child:
            MyCard2(title: title, author: author, body: body, fields: fields,  date: date, comments: comments,medias: medias,likes:likes, id:id)
            );
        }
      ):
      Container();
    },));
    });
  }
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
              String authorId = savedModel.extraUser.bookmarks[index].authorId;
              DiffUser diffUser = savedModel.extraUser.bookmarks[index].diffUser;
              //print(comments.length);
              return 
              Container(
                height: constraints.maxHeight,
                child: ArticleCard(comments: comments,diffUser: diffUser,authorId: authorId,author: author, title: title, body: body, likes: likes, date:date ,fields: fields,subHead: subHead, medias: medias, id:id)
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