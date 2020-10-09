import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TagItem extends StatefulWidget {
  TagItem(this.topic);
  final String topic;

  @override
  _TagItemState createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  Color tagColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (tagColor == Colors.white) {
              print('SUFAHKL');
              tagColor = Hexcolor('#FBD772');
            } else if (tagColor == Hexcolor('#FBD772')) {
              tagColor = Colors.white;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: tagColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Center(
              child: Text(
                widget.topic,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleTagItem extends StatelessWidget {
  ArticleTagItem(this.topic);
  final String topic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Hexcolor('#FBD772'),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Center(
            child: Text(
              topic,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class PostTags extends StatelessWidget {
  final String name;
  PostTags({
    this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          child: Text(name),
        ),
      ),
    );
  }
}



class ArticleTag extends StatefulWidget {
String name;
ArticleTag({this.name});

  @override
  _ArticleTagState createState() => _ArticleTagState(name:name);
}

class _ArticleTagState extends State<ArticleTag> {
  String name;
_ArticleTagState({this.name});
 
 
  @override
  Widget build(BuildContext context) =>
  
   Padding(
       padding: const EdgeInsets.only(left: 6.0, bottom: 5),
 child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: Text(name.toString(),
            // "$fields",
              style: TextStyle(color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              color: Hexcolor('#FBD772'),
              borderRadius: BorderRadius.circular(30)),
        ),
        
      );
 }



/*  //When ArticleTag is stateless
  class ArticleTag extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) =>
   Padding(
       padding: const EdgeInsets.only(left: 6.0, bottom: 5),
 child: Container(

           child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: Text(
              "Subject ,",
              style: TextStyle(color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              color: Hexcolor('#FBD772'),
              borderRadius: BorderRadius.circular(30)),
        ),
      );
 }

*/

/*
Container(
                      height: 20,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: fields.length,
                        itemBuilder: (context, index) {
                          print('$fields');
                          return Card(
                            color: Hexcolor("#FBD772"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                    //color: Hexcolor("#1f405e"),
                                    )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "${fields[index]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),*/
                  

       

