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
