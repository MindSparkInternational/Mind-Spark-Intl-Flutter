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
  User({this.id, this.email, this.firstName, this.lastName, this.date, this.age, this.country, this.img});

  factory User.fromJson(Map<String, dynamic> json){
    print("Made it");
    print("fields runtype: ${json['fields'].runtimeType}");
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      date: json["date_joined"],
      age: json["age"],
      img: "",
      country: ""
    );
  }
}