import 'package:MindSpark/dataClasses/comment.dart';

class User{
  String id;
  String email;
  String firstName;
  String lastName;
  String date;
  int age;
  String country;
  String img;
  String bio;
  User({this.id, this.email, this.firstName, this.lastName, this.date, this.age, this.country, this.img, this.bio});

  factory User.fromJson(Map<String, dynamic> json){
    print("Made it to User");
    
    return User(
      id: json["id"],
      email: json["email"],
      firstName: "",
      lastName: "",
      date: json["date_joined"],
      age: json["age"],
      img: "",
      country: "",
      bio: ""
    );
  }
}