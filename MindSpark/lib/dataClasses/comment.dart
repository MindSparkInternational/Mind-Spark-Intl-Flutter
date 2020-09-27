import 'package:MindSpark/dataClasses/post.dart';

class Comment{
  String author;
  int id;
  String content;
  String date;
  int likes;
  String post;
  Comment({this.author, this.id, this.content, this.date, this.post, this.likes});

  factory Comment.fromJson(Map<String, dynamic> json){
    return Comment(
      id: json["id"],
      author: json["author"],
      date: json["created_at"],
      content: json["content"],
      likes: json["likes"],
      post: json["post"]
    );
  }
}