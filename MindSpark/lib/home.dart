import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postgres/postgres.dart';
import 'package:MindSpark/homeheader.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'dart:math' as math;

Widget buttonSection = HomeHeader();
Future<void> main() async {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  final PageController crtl = PageController(viewportFraction: .8);
  final PageController crtlUp = PageController();
  final PageController crtlSecond = PageController();
  final Firestore db = Firestore.instance;
  Stream slides;
  String activeTag = "favorites";
  static int currentPage = 0;
  int currentPageUp = 0;
  int currentPageSecond = 0;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      );
      animationController.forward();
    _queryDB();
    crtlUp.addListener(() {
      int nextUp = crtlUp.page.round();
      if(currentPage != nextUp){
        setState(() {
          currentPageSecond = nextUp;
        });
      }
    });
    crtlSecond.addListener(() {
      int nextUp = crtlUp.page.round();
      if(currentPage != nextUp){
        setState(() {
          currentPageUp = nextUp;
        });
      }
    });
    crtl.addListener(() {
      int next = crtl.page.round();

      if(currentPage != next){
        setState(() {
          currentPage = next;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      new Scaffold(
      body: 
        new Column(
          children: <Widget>[
            buttonSection,
            SizedBox(
              height: 50
            ),
            new Text("$currentPage"),
            Flexible(child:
            new PageView(
              controller: crtlUp,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                 Flexible(
                  child: 
                  GestureDetector(child:
                      StreamBuilder(
                      stream: slides,
                      initialData: [],
                      builder: (context, AsyncSnapshot snap){
                        List slideList = snap.data.toList();

                        return PageView.builder(
                          controller: crtl,
                          physics: BouncingScrollPhysics(),
                          itemCount: slideList.length+1,
                          itemBuilder: (context, int currentIndex){
                            if(currentIndex == 0){
                              return _buildTagPage();
                            }
                            else if(slideList.length >= currentIndex){
                              bool active = currentIndex == currentPage;
                              return _buildStoryPage(slideList[currentIndex-1], active);
                            }
                          }
                        );
                      },
                    ),
                    onTap: (){
                      print("hello + $currentPage");
                    }
                  )
                ),
                PageView.builder(
                  controller: crtl,
                  itemCount: 9,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, int currentIndex){
                    if(currentIndex == 0){
                      return _buildTagPage();
                    }
                    bool active = currentIndex == currentPage;
                    return _buildBlurbPage(active);
                  }
                ),
                Flexible(
                  child: 
                   new PageView(
                     children: <Widget>[
                       new Container(color: Colors.black,),
                       new Container(color: Colors.blue,),
                       new Container(color: Colors.yellow,),
                     ],
                   )
                ),
              ],
            )
            ),
          ],
        )
    ),
    ); 
  }

  Stream _queryDB({String tag = 'favorite'}){
    Query query = db.collection("article");
    slides = query.snapshots().map((list) => list.documents.map((doc) => doc.data));
  }

  _buildStoryPage(Map data, bool active){
    final double blur  = active ? 10:0;
    final double offset  = active ? 20:0;
    final double top  = active ? 100:200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: 10, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mind-spark-international.appspot.com/o/uploads%2F"+data['imageURL']+"?alt=media&"),
        ),
        boxShadow: [BoxShadow(color: Colors.black87, offset: Offset(offset, offset))]
        ),);

  }

  _buildBlurbPage( bool active){
    final double blur  = active ? 10:0;
    final double offset  = active ? 20:0;
    final double top  = active ? 100:200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: 10, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Ffd%2Fd7%2F83%2Ffdd783a36cc9f52977908754e6dcb52a.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F462533824216511142%2F&tbnid=PvEDGnROouzqSM&vet=12ahUKEwizvIfZ-cPqAhUPPd8KHUPXBRMQMygJegUIARDZAQ..i&docid=j2zthd2JJKWaxM&w=600&h=1212&q=pretty%20waterfalls&ved=2ahUKEwizvIfZ-cPqAhUPPd8KHUPXBRMQMygJegUIARDZAQ"),
        ),
        boxShadow: [BoxShadow(color: Colors.black87, offset: Offset(offset, offset))]
        ),);

  }

  _buildTagPage(){
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Hellow")
        ],
      )
    );
  }
  _buildBlurbScroll(PageController crtl){
   return PageView(
     scrollDirection: Axis.vertical,
     controller: crtl,
     children: <Widget>[
       new Container(color: Colors.black,),
       new Container(color: Colors.purpleAccent,),
       new Container(color: Colors.grey,),
     ],
   );
  }
}

