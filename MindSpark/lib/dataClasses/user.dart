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
  String website;
  String roles;
  List<String> rolesList;
  User({this.website,this.id, this.email, this.firstName, this.lastName, this.date, this.age, this.country, this.img, this.bio, this.roles});

  factory User.fromJson(Map<String, dynamic> json){
    print("Made it to User");
    String tempRoles = json["roles"] == null ? "" : json["roles"];
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      date: json["date_joined"],
      age: json["age"],
      img: json["img"],
      website:json["website"],
      country: json["country"],
      bio: json["bio"],
      roles: json["roles"] == null ? "" : tempRoles.substring(1,tempRoles.length-1)
      
    );
  }
}