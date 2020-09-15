import 'package:MindSpark/components/CommentBox.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PostCommentScreen extends StatefulWidget {
  PostCommentScreen(this.captionText);
  String captionText;
  @override
  _PostCommentScreenState createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  String getCaptionText() {
    return widget.captionText;
  }

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
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(getCaptionText()),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Expanded(child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (index, context) {
                      return Container(
                        child: CommentBox(),
                      );
                    }),
              );
            }))
          ],
        ),
      )),
    );
  }
}
