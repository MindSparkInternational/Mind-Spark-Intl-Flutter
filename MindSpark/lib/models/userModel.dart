import 'package:MindSpark/dataClasses/extraUser.dart';
import 'package:MindSpark/dataClasses/user.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{

  User user = new User();
  ExtraUser extraUser = new ExtraUser();

 
  void setUser(User newUser){
    user = newUser;
    notifyListeners();
  }
    void setExtraUser(ExtraUser newUser){
    extraUser = newUser;
    notifyListeners();
  }
} 