import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/home.dart';
import 'package:MindSpark/models/articleModel.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/animations/FadeAnimation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:MindSpark/components/EngageMentComponents.dart';
import 'package:MindSpark/components/PostCard.dart';
import 'package:MindSpark/articlePage.dart';
import 'package:provider/provider.dart';

class ArticleCard extends StatefulWidget {
  String title;
  String author;
  String body;
  String subHead;
  List<dynamic> fields;
  List<Comment> comments;
  int likes;
  String date;
  ArticleCard({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date,this.subHead});
  @override
  _ArticleCardState createState() => _ArticleCardState(title: title, author: author, body: body, fields: fields, likes: likes, comments: comments, date: date,subHead:subHead);
}

class _ArticleCardState extends State<ArticleCard> {
  String title;
  String author;
  String body;
  String date;
  String subHead;
  int likes;
  List<dynamic> fields;
  List<Comment> comments;
  _ArticleCardState({this.title, this.author, this.body, this.fields, this.likes, this.comments, this.date,this.subHead});
  
  @override
  Widget build(BuildContext context) => FadeAnimation(
      0.25,
      Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Hexcolor('#E5E5E5')),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.0,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Text('$title',
                         // widget.title,
                   //   "CLIMATE CHANGE, NOT HUNTERS, MAY HAVE KILLED OFF WOOLLY RHINOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Hexcolor('#FFFFFF'),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 1, left: 8, right: 8),
                              child: Container(child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: constraints.maxHeight * 0.55,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            'assets/img/Image2.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    
                                   Consumer<ArticleModel>(builder: (context, articleModel, child){
                                      return ArticleDetails(author:author,date:date);
                                   },),
                                    //  ArticleDetails(author:author,date: date,),
//                                      Divider(
//                                        thickness: 0.2,
//                                        color: Colors.white,
//                                      ),
                                      Expanded(
                                        child: Container(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0,
                                                  vertical: 10),
                                      child: Text(
                                                '$body',
                                              // widget.body,
                                               // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          height: constraints.maxHeight * 0.2,
                                        ),
                                      ),
//                                      Divider(
//                                        thickness: 0.2,
//                                        color: Colors.white,
//                                      ),
                                    ],
                                  ),
                                );
                              })),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Consumer<ArticleModel>(builder: (context, articleModel, child) {
                              return
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: LayoutBuilder(builder:
                                    (BuildContext context,
                                        BoxConstraints constraints) {
                                  return GestureDetector(
                                    onTap: () {
                                      
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                   return ArticleScreen(title: title,body: body,author: author,date: date, subHead:subHead);
                                      }));
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * 0.5,
                                      decoration: BoxDecoration(
                                          color: Hexcolor('#1F415F'),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text('View Article',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  );
                                })
                                );}
                          ),
                           ) ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )));
}
