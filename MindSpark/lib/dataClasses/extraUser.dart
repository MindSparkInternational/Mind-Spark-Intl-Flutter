import 'package:MindSpark/components/PostCommentScreen.dart';
import 'package:MindSpark/dataClasses/article.dart';
import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/dataClasses/user.dart';

import 'comment.dart';

class ExtraUser{
  String id;
  String user;
  int following;
  int followers;
  List<Post> posts;
  List<Article> articles;
  User userFull;
  List<Article> bookmarks;
  ExtraUser({this.articles,this.id,  this.user,this.followers, this.following, this.posts, this.bookmarks, this.userFull});

  factory ExtraUser.fromJson(Map<String, dynamic> json){
    print("Made it to User");
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

    List<Article> articles = new List();
    for(Map map in json["articles"]){
      articles.add(Article.fromJson(map as Map<String, dynamic>));
    }
    for(Article article in articles){
      List<Comment> commentsList = new List();
      for(Map map in article.comments){
        commentsList.add(Comment.fromJson(map as Map<String, dynamic>));
      }
      article.finalComments = commentsList;
    }

    List<Article> book = new List();
    for(Map map in json["bookmarks"]){
      book.add(Article.fromJson(map as Map<String, dynamic>));
    }
    for(Article article in book){
      List<Comment> commentsList = new List();
      for(Map map in article.comments){
        commentsList.add(Comment.fromJson(map as Map<String, dynamic>));
      }
      article.finalComments = commentsList;
    }
    print("LIST SIZE ${list.length}");
    
    return ExtraUser(
      id: json["id"],
      //user: json["user"],
      following: json["following"],
      followers: json["followers"],
      posts: list,
      bookmarks: book,
      userFull: User.fromJson(json["user"]),
      articles: articles
    );
  }
}