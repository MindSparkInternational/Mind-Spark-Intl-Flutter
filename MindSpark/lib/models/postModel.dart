import 'package:MindSpark/dataClasses/comment.dart';
import "package:MindSpark/dataClasses/post.dart";
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostModel extends ChangeNotifier{

  List<Post> posts = new List();

  void addToList(Post post){
    posts.add(post);
    notifyListeners();
  }
  Post accessIndex(int index){
    return posts[index];
  }
  void setList(List<Post> postsInput){
    posts = postsInput;
    notifyListeners();
  }
  void setComments(int index, List<Comment> comment){
    posts[index].finalComments = comment;
  }
} 