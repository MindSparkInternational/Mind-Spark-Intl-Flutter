import 'dart:convert';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:hexcolor/hexcolor.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _currentName;
  File imageFile;
  final _formKey = GlobalKey<FormState>();
  TextEditingController bioController = new TextEditingController();
  TextEditingController websiteController = new TextEditingController();

  Future uploadPic(BuildContext context) async {
    // String fileName = basename(_image.path);
    //  StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    //  StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //  StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }

  Future<List<String>> getCountries() async {
    var response = await http.get("https://restcountries.eu/rest/v2/all%22");
    var responseBody = await jsonDecode(response.body);

    List<String> countries = new List();
    for (Map map in responseBody) {
      await countries.add(map["name"]);
    }
    print(countries);
    int countriesnumber = countries.length;
    return countries;
  }

//---------------
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Choose photo"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 500, height: 500);
    } else {
      return Text("Please select an image");
    }
  }

  TextEditingController controller = TextEditingController();
//-------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Hexcolor('#FBD772'),
          title: Center(child: Text("Profile Settings")),
        ),
        backgroundColor: Hexcolor('#FBD772'),
        body: Builder(
            builder: (context) => (Container(
                child: Form(
                    key: _formKey,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        CircleAvatar(
                                          radius: 80,
                                          // backgroundColor: Color(0xff476cfb),
                                          child: ClipOval(
                                            child: new SizedBox(
                                              width: 200.0,
                                              height: 200.0,
                                              child: (imageFile != null)
                                                  ? Image.file(
                                                      imageFile,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.network(
                                                      "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              FontAwesomeIcons.camera,
                                              color: Hexcolor("#60aaa1"),
                                              size: 33.0,
                                            ),
                                            onPressed: () {
                                              _showSelectionDialog(context);
                                              // getImage();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        "Bio",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Hexcolor("#1F3E5A")),
                                      ),
                                    ),
                                    TextField(
                                      controller: bioController,
                                      maxLines: 5,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          hintText: "Enter bio here",
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Hexcolor("#FFEEB1")),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        "Website",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Hexcolor("#1F3E5A")),
                                      ),
                                    ),
                                    TextField(
                                      controller: websiteController,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          hintText: "www.mywebsite.com",
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          filled: true,
                                          fillColor: Hexcolor("#FFEEB1")),
                                    ),
                                  ],
                                ),
                               
                                Center(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      onPressed: () async{
                                        uploadPic(context);
                                        //Navigator.pop(context);
                                        SharedPreferences preferences = await SharedPreferences.getInstance();
                                        String token = preferences.getString("token");
                                        var response;
                                        if((bioController.text != null && bioController.text != "" && bioController.text != " ") && (websiteController.text != null && websiteController.text != "" && websiteController.text != " ")){
                                          print("here1");
                                          response = await http.put(
                                            "https://mindsparkapi.herokuapp.com/api/v1/auth/user/",
                                            headers: {
                                              "Authorization":token,
                                            },
                                            body: {
                                              "bio":bioController.text,
                                              "website": websiteController.text
                                            }
                                          );
                                        }
                                        if((bioController.text == null || bioController.text == "" || bioController.text == " ") && (websiteController.text != null && websiteController.text != "" && websiteController.text != " ")){
                                          print("here2");
                                          response = await http.put(
                                            "https://mindsparkapi.herokuapp.com/api/v1/auth/user/",
                                            headers: {
                                              "Authorization":token,
                                            },
                                            body: {
                                              "website": websiteController.text
                                            }
                                          );
                                        }
                                        if((bioController.text != null && bioController.text != "" && bioController.text != " ") && (websiteController.text == null || websiteController.text == "" || websiteController.text == " ")){
                                          print("here3");
                                          response = await http.put(
                                            "https://mindsparkapi.herokuapp.com/api/v1/auth/user/",
                                            headers: {
                                              "Authorization":token,
                                            },
                                            body: {
                                              "bio":bioController.text,
                                            }
                                          );
                                        }
                                        else{
                                          
                                        }
                                        print(response.body);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              color: Hexcolor("#1F3E5A"),
                                              fontSize: 20),
                                        ),
                                      )),
                                ),
                              ]),
                        ),
                      ),
                    ))))));
  }
}
