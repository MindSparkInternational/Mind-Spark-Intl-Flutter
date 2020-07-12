import 'package:flutter/material.dart';
import 'filterDashLayout.dart';
import 'home.dart';
import 'homeheader.dart';

class DrawerStack extends StatefulWidget {
  @override
  _DrawerStackState createState() => _DrawerStackState();
}

class _DrawerStackState extends State<DrawerStack> {
  bool isCollapsed = true;
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
    return AnimatedPositioned(
      duration: duration,
      top: HomeHeaderState.isCollapsed ? 0: .2 * screenHeight,
      bottom: HomeHeaderState.isCollapsed ? 0:.2 * screenWidth,
      left: HomeHeaderState.isCollapsed ? 0:.6*screenWidth,
      right: HomeHeaderState.isCollapsed ? 0:-.4*screenWidth,
      child: Home(),
    );
  }
}