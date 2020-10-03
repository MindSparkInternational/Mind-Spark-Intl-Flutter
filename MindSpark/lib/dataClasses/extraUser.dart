import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/dataClasses/post.dart';

class ExtraUser{
  String id;
  String user;
  int following;
  int followers;
  List<Post> posts;
  ExtraUser({this.id,  this.user,this.followers, this.following, this.posts});

  factory ExtraUser.fromJson(Map<String, dynamic> json){
    print("Made it to User");
    List<Post> list = new List();
    for(Map map in json["posts"]){
      list.add(Post.fromJson(map as Map<String, dynamic>));
    }
    print("LIST SIZE ${list.length}");
    
    return ExtraUser(
      id: json["id"],
      user: json["user"],
      following: json["following"],
      followers: json["followers"],
      posts: list
    );
  }
}