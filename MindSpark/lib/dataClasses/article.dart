import 'package:MindSpark/dataClasses/comment.dart';

class Article{
  String title;
  String author;
  String id;
  String body;
  String subHead;
  String postType;
  String date;
  List<dynamic> fields;
  List<dynamic> comments;
  List<Comment> finalComments;
  int likes;
  int shares;
  List<dynamic> medias;
  Article({this.title, this.author, this.id, this.body, this.subHead,this.postType,this.fields,this.comments,this.likes,this.shares,this.medias, this.date});

  factory Article.fromJson(Map<String, dynamic> json){
    print("Made it");
    print("fields runtype: ${json['fields'].runtimeType}");
    return Article(
      title: json["title"],
      id: json["id"],
      author: json["author"],
      body: json["body"],
      subHead: json["sub_head"],
      postType: json["post_type"],
      fields: json["fields"] ,
      comments: json["comments"],
      likes: json["likes"],
      shares: json["Shares"],
      medias: json["medias"],
      date: json["created_at"]
    );
  }
}