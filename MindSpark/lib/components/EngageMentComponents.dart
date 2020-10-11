
import 'package:MindSpark/models/articleModel.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ArticleDetails extends StatefulWidget {
  String date;
  String author;
  List<dynamic> fields;
  BoxConstraints constraint;
  ArticleDetails({this.date, this.author, this.fields, this.constraint}); 
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState(date:date,author:author, fields: fields, constraints: constraint);
}

class _ArticleDetailsState extends State<ArticleDetails> {

  String author;
  String date;
  List<dynamic> fields;
  BoxConstraints constraints;
    _ArticleDetailsState({this.date, this.author, this.fields, this.constraints});
     
  Widget build(BuildContext context) => 
  
   Container(
          
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 3),
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: Text(
                      '$author',
                    // 'Brian Wamwea',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 3),
                  child: Container(
                      margin: EdgeInsets.all(3), 
                      child: Text(
                      date.substring(0, date.indexOf("T")),
                      //'03/25/2010',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
            //tis is when AtricleTag is Stateless 
            Container(
              child: Row(
                children: [
                    Container(
                      height: constraints.maxHeight*.05,
                      width: constraints.maxWidth*.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fields.length,
                        itemBuilder: (context, index) {
                          if(fields != null || fields.length > 0)
                            return ArticleTag(name: fields[index],);
                          else  
                            return Container();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
    );
   
    
}

class SaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.thumb_down,
        color: Colors.black,
      ),
    );
  }
}

class LikesBar extends StatefulWidget {
  int likes;
  String id;
  LikesBar({
    this.likes,
    this.id,
    Key key,
  }) : super(key: key);
  @override
  _LikesBarState createState() => _LikesBarState(likes: likes, id: id, key: key);
}

class _LikesBarState extends State<LikesBar> {
  int likes;
  bool selected = false;
  String id;
  _LikesBarState({
    this.likes,
    this.id,
    Key key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child:Icon(
              Icons.thumb_up,
              color: selected ? Colors.blue: Colors.black,
            ),
            onTap: () async{
              
              SharedPreferences preferences = await SharedPreferences.getInstance();
              var response = await http.put("https://mindsparkapi.herokuapp.com/api/v1/posts/like/",
                headers: {
                  "Authorization":preferences.getString("token")
                },
                body: {
                  "post_id":id
                }
              );
              setState(() {
                selected = !selected;
                if(selected)
                  likes +=1;
                else{
                  likes -=1;
                }
              });
            }
          ),
          Text(
            "$likes",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
