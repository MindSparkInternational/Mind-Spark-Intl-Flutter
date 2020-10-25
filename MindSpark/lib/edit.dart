import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> countries = new List();
  String _mySelection ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor("f3d266"),
      //  appBar: AppBar( backgroundColor: Hexcolor("f3d266"), ),
        body: SafeArea(

         child: SingleChildScrollView(
                    child: Column(children: [

                SizedBox(height: 20,),
                 Center(
                   child: CircleAvatar(
                           backgroundImage:  NetworkImage( 'https://git.unilim.fr/assets/no_group_avatar-4a9d347a20d783caee8aaed4a37a65930cb8db965f61f3b72a2e954a0eaeb8ba.png'),
                          radius: 50.0,
                              ),
                 ),
                  Text("Mind Spark",style: TextStyle(color:Color(0xff1f405e),fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),  
                  Text("Last save : date",style: TextStyle(color: Color(0xff1f405e)),),

                  Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "BIO",
                            style: TextStyle(
                                color: Color(0xff1f405e),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 5,
                          //controller: body,
                          onChanged: ((String body) {
                            // setState(() {
                            //   _body = body;
                            //   print(_body);
                            // });
                          }),
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Create a Bio TODAY',
                            hintStyle: TextStyle(
                                color: Color(0xff1f405e),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff60aaa1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff60aaa1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // errorText: bodyValidate
                            //     ? 'Please write detailed post'
                            //     : null,
                          ),
                        ),
                      ),
                     Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Website",
                            style: TextStyle(
                                color: Color(0xff1f405e),
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                         // controller: title,
                          onChanged: ((String title) {
                            // setState(() {
                            //   _title = title;
                            //   print(_title);
                            // });
                          }),
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'www.mindsparkintl.co',
                            hintStyle: TextStyle(
                                color: Color(0xff1f405e),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff60aaa1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff60aaa1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          //   errorText:
                          //       titleValidate ? 'Please enter title' : null,
                          // ),
                        ),
                      ),
                      ),
                       
   
                      SizedBox(height: 20,),
                        Center(
                      child: Container(
                        width: 300,
                        //   margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,

                        child: RaisedButton(
                          child: Text(
                            'Save',
                            style: TextStyle(color: Color(0xff1f405e), fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            //side: BorderSide(//  color: Hexcolor("#60aaa1"),)
                          ),
                          onPressed: () {
                             
                          },
                        ),),),
           ]),
         ),
      ));
  }
 Future<List<String>> getCountries() async {
    var response = await http.get("https://restcountries.eu/rest/v2/all/");
    var responseBody = await json.decode(response.body);
    List<String> countries = new List();
    for (Map map in responseBody) {
      await countries.add(map["name"]);
    }
    print(countries);
    return countries;
  }
}