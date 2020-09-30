import 'package:MindSpark/dataClasses/article.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import "package:MindSpark/dataClasses/post.dart";
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleModel extends ChangeNotifier{

  List<Article> articles = new List();

  void addToList(Article article){
    articles.add(article);
    notifyListeners();
  }
  Article accessIndex(int index){
    return articles[index];
  }
  void setList(List<Article> articleInput){
    articles = articleInput;
    notifyListeners();
  }
  void setComments(int index, List<Comment> comment){
    articles[index].finalComments = comment;
  }
} 