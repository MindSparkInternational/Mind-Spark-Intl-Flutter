import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class ReportClass extends StatefulWidget {
  @override
  _ReportClassState createState() => _ReportClassState();
}

class _ReportClassState extends State<ReportClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Hexcolor("#0d1822"),
      appBar: AppBar(
      backgroundColor: Hexcolor("#19222c"),
title: Text("Report Issues"),

      ),
      body: 
       
         
         
      
         Container(
  height: 200,
  child: Card(
    elevation: 5.0,
    color: Hexcolor("#19222c"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
       // side: BorderSide(width: 3, color: Colors.red),
      ),
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: 
    Column(

                
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                     TextField(
                      autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write issues',
                    hintStyle: TextStyle(color:Colors.white),
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
                    Padding(padding: EdgeInsets.all(20)),
                     RaisedButton(onPressed: (){
                       Navigator.pop(context);
                     },
                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Hexcolor("#60aaa1"),)),
                        color: Hexcolor("#1f405e"),
                     child: Text("Submit",style: TextStyle(color: Colors.white),)),
                     


                ],
              
              ),
    
    //Image.network(  'https://placeimg.com/640/480/any', fit: BoxFit.fill,),



    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(10.0),
    // ),
    // elevation: 5,
    // margin: EdgeInsets.all(10),
  ),
),
        //color: Colors.grey,
    //  Card(
       
       
    //    // color: Colors.lightBlue,

    //        child: 
    //           Column(

                
    //            // crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[

    //                  TextField(
    //               autofocus: false,
    //               style: TextStyle(fontSize: 15.0, color: Colors.black),
    //               decoration: InputDecoration(
    //                 border: InputBorder.none,
    //                 hintText: 'Write issues',
    //                // helperText: 'Report',
    //                 filled: true,
    //                 fillColor: Colors.grey,
    //                 contentPadding: const EdgeInsets.only(
    //                     left: 14.0, bottom: 6.0, top: 8.0),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderSide: BorderSide(color: Colors.red),
    //                   borderRadius: BorderRadius.circular(10.0),
    //                 ),
    //                 enabledBorder: UnderlineInputBorder(
    //                   borderSide: BorderSide(color: Colors.grey),
    //                   borderRadius: BorderRadius.circular(10.0),
    //                 ),
    //               ),
    //             ),

    //                  RaisedButton(onPressed: (){
    //                    Navigator.pop(context);
    //                  },
    //                  child: Text("Submit"),
    //                  )


    //             ],
              
    //           ),
           




           
          //),
       // ),
      
      
      
      
    );
  }
}