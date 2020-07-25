import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _currentName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Screen"),
        ),
        body: SafeArea(
            child: Container(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(width: 2, color: Colors.grey),
                    ),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                          SizedBox(height: 20.0),
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: 'Name',
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
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
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              border: InputBorder.none,
                              hintText: 'Email',
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
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
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: 'About yourSelf',
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
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
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(Icons.link),
                              border: InputBorder.none,
                              hintText: 'Link',
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
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
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              border: InputBorder.none,
                              hintText: 'Country',
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
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
                          RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Submit")),
                        ])))))));
  }
}
