import 'package:MindSpark/SecondaryProfileScreen.dart';
import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/components/TagCard.dart';
import 'package:MindSpark/dataClasses/diffUser.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataClasses/article.dart';
import 'dataClasses/comment.dart';
import 'package:http/http.dart' as http;

class ArticleScreen extends StatefulWidget {
  String title;
  String author;
  String body;
  String subHead;
  List<dynamic> fields;
  List<Comment> comments;
  int likes;
  DiffUser diffUser;
  String date;
  String id;
  List<dynamic> medias;
  ArticleScreen({this.medias,this.title, this.author, this.body, this.fields, this.likes, this.comments,this.subHead, this.date, this.id, this.diffUser});
  @override
  _ArticleScreenState createState() => _ArticleScreenState(medias:medias,diffUser:diffUser,title: title, author: author, body: body, fields: fields, likes: likes, comments: comments, subHead: subHead, date: date, id: id);
}

class _ArticleScreenState extends State<ArticleScreen> {
  String title;
  String author;
  String body;
  String date;
  DiffUser diffUser;
  List<dynamic> medias;
  int likes;
  String id;
  String subHead;
  List<dynamic> fields;
  List<Comment> comments;
  bool isSaved = false;
 _ArticleScreenState({this.medias,this.diffUser,this.title, this.author, this.body, this.fields, this.likes, this.comments,this.subHead,this.date, this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            color: Hexcolor('#E5E5E5'),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: constraints.maxHeight * 0.05,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left)),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
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
                                          child:Image.network(
                                              '${diffUser.user.img}',
                                              fit: BoxFit.fitWidth,
                                            ) ,
                                          ),
                                        )
                                       
                                        
                                        ,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                child: Text(
                                                  '$author',
                                              
                                                  //"Brian Wamwea",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondProfile(diffUser: diffUser,)));
                                                },
                                              ),
                                              
                                              Text( date.substring(0, date.indexOf("T")),
                                                
                                               // "Friday 12 May 2020",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Text('$title',
                                // widget.title,
                                  // 'Climate Change, Not Hunters, May Have Killed off Woolly Rhinos',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        
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
                                                    return ArticleTagItem(fields[index],);
                                                  else  
                                                    return Container();
                                                },
                                              ),
                                            ),
                                            // ArticleTagItem('History'),
                                            // ArticleTagItem('Math'),
                                            // ArticleTagItem('Science'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              child:Icon(Icons.thumb_up,),
                                              onTap: () async{
                                                SharedPreferences preferences = await SharedPreferences.getInstance();
                                                String token = preferences.getString("token");
                                                var response = await http.put("https://mindsparkapi.herokuapp.com/api/v1/articles/like/",
                                                  headers: {
                                                    "Authorization":token
                                                  },
                                                  body: {
                                                    "article_id":id
                                                  }
                                                );
                                                setState(() {
                                                  likes++;
                                                });
                                              },
                                            ),
                                            
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("$likes"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: isSaved ? Colors.grey:Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.bookmark),
                                                    Text('Save'),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        onTap: () async{
                                          isSaved = !isSaved;
                                          SharedPreferences preferences = await SharedPreferences.getInstance();
                                          String token = preferences.getString("token");
                                          var response = await http.put(
                                            "https://mindsparkapi.herokuapp.com/api/v1/articles/bookmark/",
                                            headers: {
                                              "Authorization": token,
                                            },
                                            body: {
                                              "article_id": id
                                            }
                                            
                                          );
                                        },
                                      ),
                                      
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                
                                              )),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.comment),
                                                    Text('Comment'),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        onTap: (){
                                          Navigator.push( 
                                            context,
                                            PageTransition(
                                                child: PostCommentScreen(comments,
                                                    id,0),
                                                type: PageTransitionType
                                                    .downToUp));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.35,
                                width: constraints.maxWidth,
                                color: Colors.red,
                                child: PageView.builder(
                                  itemCount: medias.length,
                                  itemBuilder: (context, index) {
                                    return Image.network("${medias[index]}",
                                      fit: BoxFit.fitWidth,);
                                  },
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                          child: Text('$subHead',
                                       // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                        textAlign: TextAlign.justify,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0, vertical: 5),
                                      child: Container(
                                        child: Text('$body',
                                         // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Sit amet venenatis urna cursus eget nunc. Pharetra vel turpis nunc eget. Eleifend mi in nulla posuere sollicitudin. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Netus et malesuada fames ac turpis egestas sed tempus urna. Pharetra vel turpis nunc eget lorem dolor. Feugiat sed lectus vestibulum mattis ullamcorper velit. Cursus in hac habitasse platea dictumst. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Volutpat lacus laoreet non curabitur gravida arcu ac. Molestie a iaculis at erat. Sem et tortor consequat id porta nibh. Elementum eu facilisis sed odio morbi quis commodo. Pretium fusce id velit ut tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Sit amet venenatis urna cursus eget nunc. Pharetra vel turpis nunc eget. Eleifend mi in nulla posuere sollicitudin. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Netus et malesuada fames ac turpis egestas sed tempus urna. Pharetra vel turpis nunc eget lorem dolor. Feugiat sed lectus vestibulum mattis ullamcorper velit. Cursus in hac habitasse platea dictumst. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Volutpat lacus laoreet non curabitur gravida arcu ac. Molestie a iaculis at erat. Sem et tortor consequat id porta nibh. Elementum eu facilisis sed odio morbi quis commodo. Pretium fusce id velit ut tortor.",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
