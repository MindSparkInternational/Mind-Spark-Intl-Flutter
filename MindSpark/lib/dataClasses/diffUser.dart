import 'package:MindSpark/dataClasses/article.dart';
import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/dataClasses/user.dart';

import 'comment.dart';

class DiffUser{
  
  User user;
  int followers;
  int following;
  List<Post> posts;
  List<Article> articles;
  DiffUser({this.user, this.followers, this.following, this.posts, this.articles});

  factory DiffUser.fromJson(Map<String, dynamic> json){
    print("Made it to User Different");

    List<Post> list = new List();
    for(Map map in json["posts"]){
      list.add(Post.fromJson(map as Map<String, dynamic>));
    }
    for(Post post in list){
      List<Comment> commentsList = new List();
      for(Map map in post.comments){
        commentsList.add(Comment.fromJson(map as Map<String, dynamic>));
      }
      post.finalComments = commentsList;
    }


    List<Article> articleList = new List();
    for(Map map in json["articles"]){
      articleList.add(Article.fromJson(map as Map<String, dynamic>));
    }
    for(Article article in articleList){
      List<Comment> commentsList = new List();
      for(Map map in article.comments){
        commentsList.add(Comment.fromJson(map as Map<String, dynamic>));
      }
      article.finalComments = commentsList;
    }
    print("BIG CHECK ${User.fromJson(json["user"]).firstName} ${User.fromJson(json["user"]).rolesList}");
    return DiffUser(
      user: User.fromJson(json["user"]),
      followers: json["followers"],
      following: json['following'],
      posts: list,
      articles: articleList
    );
  }
}