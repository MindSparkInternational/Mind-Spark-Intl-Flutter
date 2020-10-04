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

class MyCard2 extends StatefulWidget {
  String title;
  String author;
  String body;
  List<dynamic> fields;
  List<Comment> comments;
  int likes;
  String date;
  MyCard2({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date});
  @override
  _MyCard2State createState() => _MyCard2State(title: title, author: author, body: body, fields: fields, likes: likes, comments: comments, date: date);
}

class _MyCard2State extends State<MyCard2> {
  String title;
  String author;
  String body;
  String date;
  int likes;
  List<dynamic> fields;
  List<Comment> comments;
  _MyCard2State({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date});
  String sampletext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  bool showFullCaption = false;
  bool isTapped = false;
  bool commentTapped = false;
  
 

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
                                                                    comments),
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
