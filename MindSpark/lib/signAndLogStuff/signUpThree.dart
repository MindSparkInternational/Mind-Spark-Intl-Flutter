

import 'package:MindSpark/signAndLogStuff/signUp.dart';
import 'package:MindSpark/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'dart:convert';
import '../main.dart';

class SignUpThree extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String password;
  final String token;
  final String email;
  SignUpThree({this.firstName, this.lastName, this.password, this.token, this.email});
  @override
  _SignUpThreeState createState() => _SignUpThreeState(firstName: firstName, lastName: lastName, password: password, token: token, email: email);
}

class _SignUpThreeState extends State<SignUpThree> {
  String firstName;
  String lastName;
  String password;
  String token;
  String country;
  final String email;
  bool dateIsClicked = false;
  bool dateIsChosen = false;
  bool countryIsChosen = false;
  bool countryIsChosenAgain = true;
  List<String> countries = new List();
  DateTime selectedDate = DateTime.now();
  _SignUpThreeState({this.firstName, this.lastName, this.password, this.token, this.email});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   elevation: 0,
        //   brightness: Brightness.light,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        //   ),
        // ),
        body: Stack(
          children: [
            Container(
              child: Image.asset('assets/img/waveLight.png'),
              
            ),
            Container(
              height: constraints.maxHeight*.1,
              padding: EdgeInsets.all(10),
              alignment: Alignment.topRight,
              child: Image.asset('assets/img/MindSpark.png')
            ),
            new Container(
              padding: EdgeInsets.only(top: constraints.maxHeight*.15),
              child: new Column(
                children: [
                  new Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: constraints.maxWidth*.05),
                    child: Text("When is your birthday, $firstName?",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                    )
                  ),
                  new Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top:constraints.maxHeight*.01,left: constraints.maxWidth*.05),
                      child: GestureDetector(
                        child: dateIsClicked ?
                        Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ):
                        Shimmer.fromColors(
                          baseColor: Colors.black, 
                          highlightColor: Hexcolor("FFFFFF"),
                          child:Text(
                            "YYYY-MM-DD",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: (){
                          setState((){
                            _selectDate(context);
                            dateIsClicked = true;
                          });
                        }
                      )
                  ),
                  dateIsChosen ?
                  new Container(
                    padding: EdgeInsets.only(top: constraints.maxHeight*.1, left: constraints.maxWidth*.05),
                    alignment: Alignment.topLeft,
                    child: Text("What country do you live in?",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                  ):
                  new SizedBox(height: constraints.maxHeight*.5),
                  dateIsChosen && countryIsChosenAgain?
                  new Container( 
                    padding: EdgeInsets.only(top: constraints.maxHeight*.05, left: constraints.maxWidth*.05,right: constraints.maxWidth*.05),
                    alignment: Alignment.topLeft,
                    child: FutureBuilder(
                      future: getCountries(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Text('Press button to start.');
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Text('Awaiting result...');
                        case ConnectionState.done:
                          if (snapshot.hasError)
                            return Text('Error: ${snapshot.error}');
                          countries = snapshot.data;
                          print(countries.length);
                      }
                      return Container(
                        height: constraints.maxHeight*.1,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Hexcolor('#E5E5E5'),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left:8, right: 8, ),
                              height: constraints.maxHeight*.1,
                              child: Column(
                                children: [
                                  SizedBox(height: constraints.maxHeight*.025),
                                  Text(countries[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                                
                              )
                              ),
                              onTap: () {
                                print(countries[index]);
                                setState(() {
                                  country = countries[index];
                                  countryIsChosen = true;
                                  countryIsChosenAgain = false;
                                });
                              },
                            );
                          },
                        )
                      );
                    },)
                  ):
                  new SizedBox(height: 0),
                  countryIsChosen?
                  new GestureDetector(
                    child: new Container(
                      alignment: Alignment.center,
                      height: constraints.maxHeight*.2,
                      child: Text(country,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                    onTap: (){
                      setState(() {
                        countryIsChosenAgain = true;
                        countryIsChosen = false;
                      });
                    },
                  ):
                  new SizedBox(height: 0),
                  countryIsChosen && dateIsChosen?
                  new Column(children: [
                    new SizedBox(height: constraints.maxHeight*.3,),
                    new Container(
                    alignment: Alignment.center,
                    height: constraints.maxHeight*.15,
                    width: constraints.maxWidth*.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                    ),
                    child: new MaterialButton(
                      onPressed: () async{
                        print(token);
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.setString("token", "Token " + token);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Splash(),));
                        var response = await http.put("https://mindsparkapi.herokuapp.com/api/v1/auth/user/",
                        headers: {
                          "Authorization": preferences.getString("token")
                        },
                          body: 
                          {
                            "first_name": firstName,
                            "last_name": lastName,
                            
                            "age": "0",
                            "country":country,
                            "bio":"String"
                          }
                        );
                      },
                      minWidth: double.infinity,
                      height: constraints.maxHeight*.15,
                      color: Colors.greenAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Continue", style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 30
                      ),),
                    )
                  )
                  ],):
                  
                  new SizedBox()
                ]
              ),    
            ),
            
          ],
        ) 
        );
      
      })
        
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      builder: (context, child){
        return Theme(
          child: child,
          data: ThemeData.light(), 
        );
      }
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateIsChosen = true;
      }
    );
  }
  Future<List<String>> getCountries() async{
     var response = await http.get("https://restcountries.eu/rest/v2/all");
     var responseBody = await json.decode(response.body);
     List<String> countries = new List();
     for(Map map in responseBody){
       await countries.add(map["name"]);
     }
     print(countries);
     return countries;
  }
  
}