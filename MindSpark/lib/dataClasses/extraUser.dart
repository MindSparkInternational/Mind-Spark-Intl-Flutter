import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/dataClasses/article.dart';
import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/dataClasses/user.dart';

class ExtraUser{
  String id;
  String user;
  int following;
  int followers;
  List<Post> posts;
  User userFull;
  List<Article> bookmarks;
  ExtraUser({this.id,  this.user,this.followers, this.following, this.posts, this.bookmarks, this.userFull});

  factory ExtraUser.fromJson(Map<String, dynamic> json){
    print("Made it to User");
    List<Post> list = new List();
    for(Map map in json["posts"]){
      list.add(Post.fromJson(map as Map<String, dynamic>));
    }
    List<Article> book = new List();
    for(Map map in json["bookmarks"]){
      book.add(Article.fromJson(map as Map<String, dynamic>));
    }
    print("LIST SIZE ${list.length}");
    
    return ExtraUser(
      id: json["id"],
      //user: json["user"],
      following: json["following"],
      followers: json["followers"],
      posts: list,
      bookmarks: book,
      userFull: User.fromJson(json["user"])
    );
  }
}