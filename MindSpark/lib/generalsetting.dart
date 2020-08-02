import 'edit.dart';
import 'report.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
class PageWithAnimatedList extends StatefulWidget {
  @override
  _PageWithAnimatedListState createState() => _PageWithAnimatedListState();
}

class _PageWithAnimatedListState extends State<PageWithAnimatedList> {
  var _animatedlistItems = <Widget>[];
  final GlobalKey<AnimatedListState> _animatedlistKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  void _loadItems() {
    final fetchedList = [
      Card(
   color: Hexcolor("#1f405e"),
           // color: Colors.grey,
             shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
      ),
        child:
      ListTile(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white),),
        trailing: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfile()),
          );
        },
      ),
      ),

      Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
      ),
      color: Hexcolor("#1f405e"),
        child:
      ListTile(
        title: Text('Theme dark and Light ',style: TextStyle(color: Colors.white),),
        trailing: Icon(Icons.lightbulb_outline, color: Colors.white),
        onTap: null,
      ),
      ),
      Card(
       color: Hexcolor("#1f405e"),
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
      ),
        child:
      ListTile(
        title: Text('Report issues',style: TextStyle(color: Colors.white),),
        trailing: Icon(Icons.report_problem, color: Colors.white),
        onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportClass()),
          );
        } ,

      ),),
      Card(
  color: Hexcolor("#1f405e"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
      ),
        child:
      ListTile(
        title: Text('Logout ',style: TextStyle(color: Colors.white),),
        trailing: Icon(Icons.exit_to_app, color: Colors.white),
        onTap: null,
      ),
      ),
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _animatedlistItems.add(fetchedList[i]);
          _animatedlistKey.currentState.insertItem(_animatedlistItems.length - 1);
        });
      });
    }
  }

  // void _unloadItems() {
  //   var future = Future(() {});
  //   for (var i = _listItems.length - 1; i >= 0; i--) {
  //     future = future.then((_) {
  //       return Future.delayed(Duration(milliseconds: 100), () {
  //         final deletedItem = _listItems.removeAt(i);
  //         _listKey.currentState.removeItem(i,
  //             (BuildContext context, Animation<double> animation) {
  //           return SlideTransition(
  //             position: CurvedAnimation(
  //               curve: Curves.easeOut,
  //               parent: animation,
  //             ).drive((Tween<Offset>(
  //               begin: Offset(1, 0),
  //               end: Offset(0, 0),
  //             ))),
  //             child: deletedItem,
  //           );
  //         });
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor("#0d1822"),
      appBar: AppBar(
        backgroundColor: Hexcolor("#19222c"),
        title: Text("Settings Details"),
      
      ),
      body: AnimatedList(
        key: _animatedlistKey,
        padding: EdgeInsets.only(top: 10),
        initialItemCount: _animatedlistItems.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: CurvedAnimation(
              curve: Curves.easeOut,
              parent: animation,
            ).drive((Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ))),
            child: _animatedlistItems[index],
          );
        },
      ),
    );
  }
}
