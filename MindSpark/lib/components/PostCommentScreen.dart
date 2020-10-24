import 'dart:convert';

import 'package:MindSpark/components/CommentBox.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PostCommentScreen extends StatefulWidget {
  PostCommentScreen(this.captionText, this.id,this.articleOrPost);
  String id;
  int articleOrPost;
  List<Comment> captionText;
  @override
  _PostCommentScreenState createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  final commentController = TextEditingController();
  List<Comment> getCaptionText() {
    return widget.captionText;
  }
  void setCaption(Comment comment){
    widget.captionText.add(comment);
  }

//  List<Widget> getItems(int index){
//    List<CommentBox> commentlist=[];
//    List comments= getCaptionText();
//    for(Widget comment in comments)
//      {
//        commentlist.add();
//
//      }
//  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Hexcolor('#E5E5E5'),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                    Text(
                      'Comments',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Icon(Icons.comment),
                  ],
                ),
              ),
            ),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  child: ListView.builder(
                      itemCount: getCaptionText().length,
                      itemBuilder: (context, index) {
                        //var parsedJson = json.decode(getCaptionText()[index]);
                        print("made it");
                        return Container(
                          child: CommentBox(
                            caption: getCaptionText()[index].content,
                            author: getCaptionText()[index].author,
                          ),
                        );
                      }),
                );
              },
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black, width: 0.8))),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: "Enter your comment here",
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(

                    child: Icon(
                      Icons.check,
                      size: 32,
                    ),
                    onTap: () async{
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      String token = preferences.getString("token");
                      var response = widget.articleOrPost==1 ?await http.post("https://mindsparkapi.herokuapp.com/api/v1/posts/comment/",
                        headers: {
                          "Authorization":token
                        },
                        body:{
                          "id": widget.id,
                          "content":commentController.text

                        }
                      ):
                      await http.post("https://mindsparkapi.herokuapp.com/api/v1/articles/comment/",
                        headers: {
                          "Authorization":token
                        },
                        body:{
                          "id": widget.id,
                          "content":commentController.text

                        }
                      );
                      var responseBody = json.decode(response.body);
                      Comment comment = Comment.fromJson(responseBody);
                      commentController.text = "";
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      setState(() { widget.captionText.add(comment); });
                    },
                  )
                  
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
