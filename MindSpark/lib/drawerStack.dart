import 'package:flutter/material.dart';
import 'filterDashLayout.dart';
import 'home.dart';
import 'homeheader.dart';

class DrawerStack extends StatefulWidget {
  @override
  DrawerStackState createState() => DrawerStackState();
}
class Check extends StatefulWidget{
  static bool isCollapsed = true;
  void set switchTask(bool newCollapsed){
    isCollapsed = newCollapsed;
    print(isCollapsed);
  }
   @override
   DrawerStackState createState() => DrawerStackState();
}
class DrawerStackState extends State<DrawerStack> {
  double screenWidth, screenHeight;
  Duration duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Stack( 
      children: <Widget>[
        main(context),
        dashboard(context),
        
      ],
    );
  }
  Widget main(context){
    return FilterDashLayout();
  }
  Widget dashboard(context){
    print(Check.isCollapsed);
    return AnimatedPositioned(
      duration: duration,
      top: Check.isCollapsed ? 0: .1 * screenHeight,
      bottom: Check.isCollapsed ? 0:.2 * screenWidth,
      left: Check.isCollapsed ? 0:-.6*screenWidth,
      right: Check.isCollapsed ? 0:.4*screenWidth,
      child: Scaffold(
        body:     
          GestureDetector(
            child: Home(),
            onTap: () {
              setState(() {
                Check.isCollapsed = !Check.isCollapsed;
              });
            },
          ),
      )
    );
  }
}