import 'package:MindSpark/filterDashLayout.dart';
import 'package:MindSpark/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'drawerStack.dart';


Widget addButton = Icon(Icons.add, color: Colors.white);
class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();

}
class Variables {
  static bool isCollapsed = true;
  void set collapsed(bool isCollapsedNew){
    isCollapsed = isCollapsedNew;
    print(isCollapsed);
  }
  
}

class _HomeHeaderState extends State<HomeHeader> with SingleTickerProviderStateMixin{
  int count = 6;
  static bool isCollapsed = true;
  AnimationController animationController;
  double screenWidth, screenHeight;
  Duration duration = const Duration(milliseconds: 300);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 1),
      );
      animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      height: 101,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: i == 0
                      ? const EdgeInsets.only(right: 9.0)
                      : const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurpleAccent),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          backgroundImage:
                              NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSVOoQBQsK8p4dyq-yvxq3HYygkU6HLzQTr4A&usqp=CAU")
                        ),
                      ),
                      Text(
                        "Mind Spark Demo",
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white,
                            ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 5.0),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      //Scaffold.of(context).openEndDrawer();
                      int countSecond = 1;
                      count++;
                      print(count);
                      setState(() {
                        count = count;
                        Check.isCollapsed = !Check.isCollapsed;
                        Check().switchTask = Check.isCollapsed;
                        //print(check.isCollapsed);
                        
                      });
                      //Variables().collapsed = Variables.isCollapsed;
                    },
                    child: addButton,
                  ) 
                ),
              ),
              Text(
                "Add",
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget menu(context){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: 
        Align(
          alignment: Alignment.centerLeft,
          child: 
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Dashbord", style: TextStyle(color:Colors.white,fontSize: 20),),
                SizedBox(height: 10,),
                new Text("Filter", style: TextStyle(color:Colors.white,fontSize: 20),),
                SizedBox(height: 10,),
                new Text("Filter2", style: TextStyle(color:Colors.white,fontSize: 20),),
                SizedBox(height: 10,),
                new Text("Filter4", style: TextStyle(color:Colors.white,fontSize: 20),)
              ],
            ),
        ),
    );
  }
}