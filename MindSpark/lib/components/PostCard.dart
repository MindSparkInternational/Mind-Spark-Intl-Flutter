import 'package:MindSpark/SecondaryProfileScreen.dart';
import 'package:MindSpark/components/CommentBox.dart';
import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/dataClasses/diffUser.dart';
import 'package:MindSpark/home.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/animations/FadeAnimation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:MindSpark/components/EngageMentComponents.dart';
import 'package:MindSpark/components/CommentBox.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:MindSpark/models/postModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

class MyCard2 extends StatefulWidget {
  String title;
  String author;
  String body;
  List<dynamic> fields;
  List<Comment> comments;
  List<dynamic> medias;
  int likes;
  String date;
  String id;
  String profImg;
  bool inSecond = false;
  DiffUser diffUser;
  MyCard2({this.profImg,this.inSecond,this.diffUser,this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.medias, this.id});
  @override
  _MyCard2State createState() => _MyCard2State(profImg:profImg,inSecond:inSecond,diffUser:diffUser,title: title, author: author, body: body, fields: fields, likes: likes, comments: comments, date: date, medias: medias, id:id);
}

class _MyCard2State extends State<MyCard2> {
  String title;
  String author;
  String body;
  String id;
  String profImg;
  bool inSecond = false;
  String date;
  int likes;
  DiffUser diffUser;
  List<dynamic> fields;
  List<dynamic> medias;
  List<Comment> comments;
  _MyCard2State({this.profImg,this.inSecond,this.diffUser,this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date, this.medias, this.id});
  String sampletext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  bool showFullCaption = false;
  bool isTapped = false;
  bool commentTapped = false;
  PageController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }
 


  @override
  Widget build(BuildContext context) => FadeAnimation(0.25, LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            print(date);
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
                                                profImg != null?
                                                  Image.network(
                                                    '${profImg}',
                                                    fit: BoxFit.fitWidth,
                                                  ):
                                                CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child:
                                                  diffUser.user.img == null?
                                                  Icon(
                                                    Icons.face,
                                                    size: 30,
                                                  ):
                                                  Container(
                                                    height: 60,
                                                    width: 60,
                                                    child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(30),
                                                    child:
                                                    Image.network(
                                                      '${diffUser.user.img}',
                                                      fit: BoxFit.fitWidth,
                                                    )
                                                    ),
                                                  )
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: 
                                                    GestureDetector(
                                                      child:Text(
                                                        author,
                                                      ),
                                                      onTap: (){
                                                        inSecond == false ? Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondProfile(diffUser: diffUser,))):print("hello");
                                                      },
                                                    )
                                                    
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
                                            child: PageView.builder(
                                              itemCount: medias.length,
                                              controller: controller,
                                              itemBuilder: (context, index) {
                                                return Image.network("${medias[index]}",
                                                fit: BoxFit.fitWidth,);
                                              },
                                              
                                              )
                                            
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    medias.length > 1 ?
                                    SmoothPageIndicator(
                                      controller: controller, 
                                      count: medias.length,
                                      effect: ScrollingDotsEffect(
                                        activeDotColor: Colors.blue,
                                        dotHeight: 10,
                                        dotWidth: 10
                                      )
                                    ):
                                    Container(),
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
                                                
                                              ),
                                            ),
                                          ),

                                          
                                          // GestureDetector(
                                          //   child: Expanded(
                                          //     child: Padding(
                                          //       padding:
                                          //           const EdgeInsets.symmetric(
                                          //               vertical: 1,
                                          //               horizontal: 5),
                                          //       child: Container(
                                          //         decoration: BoxDecoration(
                                          //             color: Colors.white,
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     25)),
                                          //         child: Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment.center,
                                          //           children: [
                                          //             Icon(Icons.bookmark),
                                          //             Text('Save')
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   onTap: () async{
                                          //     SharedPreferences preferences = await SharedPreferences.getInstance();
                                          //     String token = preferences.getString("token");
                                          //     var response = await http.put(
                                          //       "https://mindsparkapi.herokuapp.com/api/v1/articles/bookmark/",
                                          //       headers: {
                                          //         "Authorization": token,
                                          //       },
                                          //       body: {
                                          //         "article_id": id
                                          //       }
                                                
                                          //     );
                                          //   },
                                          // )
                                          
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
                                                    Container(
                                                      height: constraints.maxHeight*.04,
                                                      width: constraints.maxWidth*.4,
                                                      child: ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: fields.length,
                                                        itemBuilder: (context, index) {
                                                          if(fields != null || fields.length > 0)
                                                            return PostTags(name: fields[index],);
                                                          else  
                                                            return Container();
                                                        },
                                                      ),
                                                    ),
                                                    
                                                    // PostTags(name: "text"),
                                                    // PostTags(name: "text"),
                                                    // PostTags(name: "text"),
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
                                                    LikesBar(likes: likes, id: id,),
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
                                            body,
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
                                                                    comments, id,1),
                                                                type: PageTransitionType
                                                                    .downToUp));
                                                      },
                                                      child: Text(
                                                        comments.length == 0 ? "No Comments":"View ${comments.length} Comments",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                    comments.length == 0 ?CommentBox(caption:"No Comments", author: "",):CommentBox(caption:comments[0].content, author: comments[0].author,),
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
