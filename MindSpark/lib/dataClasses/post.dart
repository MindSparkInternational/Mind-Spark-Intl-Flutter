import 'package:MindSpark/dataClasses/comment.dart';

class Post{
  String title;
  String author;
  String id;
  String body;
  String subHead;
  String postType;
  String date;
  List<dynamic> fields;
  List<dynamic> comments;
  int likes;
  int shares;
  List<dynamic> medias;
  Post({this.title, this.author, this.id, this.body, this.subHead,this.postType,this.fields,this.comments,this.likes,this.shares,this.medias, this.date});

  factory Post.fromJson(Map<String, dynamic> json){
    print("Made it");
    print("fields runtype: ${json['fields'].runtimeType}");
    return Post(
      title: json["title"],
      id: json["id"],
      author: json["author"],
      body: json["body"],
      subHead: json["sub_head"],
      postType: json["post_type"],
      fields: json["fields"],
      comments: json["comments"],
      likes: json["likes"],
      shares: json["Shares"],
      medias: json["medias"],
      date: json["created_at"]
    );
  }
}