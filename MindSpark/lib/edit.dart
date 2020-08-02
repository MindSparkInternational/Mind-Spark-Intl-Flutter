import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:hexcolor/hexcolor.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _currentName;
  File imageFile;
  final _formKey = GlobalKey<FormState>();

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

//-------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor("#0d1822"),
        appBar: AppBar(
          backgroundColor: Hexcolor("#19222c"),
          title: Text("Edit Screen"),
        ),
        body: Builder(
            builder: (context) => (Container(
                child: Card(
                    elevation: 5.0,
                    color: Hexcolor("#19222c"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //side: BorderSide(width: 2, color: Colors.red),
                    ),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
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
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 60.0, right: 10),
                                child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.camera,
                                    color: Hexcolor("#60aaa1"),
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    _showSelectionDialog(context);
                                    // getImage();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Hexcolor("#60aaa1"),
                              ),
                              border: InputBorder.none,
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Hexcolor("#60aaa1"),
                              ),
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Hexcolor("#60aaa1"),
                              ),
                              border: InputBorder.none,
                              hintText: 'About yourself',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.link,
                                color: Hexcolor("#60aaa1"),
                              ),
                              border: InputBorder.none,
                              hintText: 'Link',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.location_on,
                                color: Hexcolor("#60aaa1"),
                              ),
                              border: InputBorder.none,
                              hintText: 'Country',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButton(
                              color: Hexcolor("#1f405e"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: Hexcolor("#60aaa1"),
                                  )),
                              onPressed: () {
                                uploadPic(context);
                                //Navigator.pop(context);
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              )),
                        ]))))))));
  }
}
