import 'package:MindSpark/home.dart';
import 'package:flutter/material.dart';
import 'package:MindSpark/components/TagCard.dart';

class ArticleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
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
                        'Brian Wamwea',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 3),
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: Text(
                        '03/25/2010',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  ArticleTag(),
                  ArticleTag(),
                  ArticleTag(),
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

class LikesBar extends StatelessWidget {
  int likes;
  LikesBar({
    this.likes,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child:Icon(
              Icons.thumb_up,
              color: Colors.black,
            ),
            onTap: (){
              
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
