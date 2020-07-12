import 'package:flutter/material.dart';

import 'home.dart';

final Color color = Color(0xFF4A4A58);
Future<void> main() async {
  runApp(new MaterialApp(
    home: new FilterDashLayout()
  ));
}

class FilterDashLayout extends StatefulWidget {
  @override
  _FilterDashLayoutState createState() => _FilterDashLayoutState();
}

class _FilterDashLayoutState extends State<FilterDashLayout> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  Duration duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: menu(context),
    );
  }
  Widget menu(context){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: 
        Align(
          alignment: Alignment.centerRight,
          child: 
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  Widget dashboard(context){
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0: .2 * screenHeight,
      bottom: isCollapsed ? 0:.2 * screenWidth,
      left: isCollapsed ? 0:.6*screenWidth,
      right: isCollapsed ? 0:-.4*screenWidth,
      child: Column(children: <Widget>[
        
      ],),
    );
  }
}