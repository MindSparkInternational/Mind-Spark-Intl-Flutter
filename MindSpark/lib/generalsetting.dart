import 'edit.dart';
import 'report.dart';
import 'package:flutter/material.dart';


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
        
            color: Colors.grey,
        child:
      ListTile(
        title: Text('Edit Profile'),
        trailing: Icon(
          Icons.edit,
          color: Colors.redAccent,
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
        color: Colors.grey,
        child:
      ListTile(
        title: Text('Theme dark and Light '),
        trailing: Icon(Icons.lightbulb_outline, color: Colors.redAccent),
        onTap: null,
      ),
      ),
      Card(
            color: Colors.grey,
        child:
      ListTile(
        title: Text('Report issues'),
        trailing: Icon(Icons.report_problem, color: Colors.redAccent),
        onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportClass()),
          );
        } ,

      ),),
      Card(
            color: Colors.grey,
        child:
      ListTile(
        title: Text('Logout '),
        trailing: Icon(Icons.exit_to_app, color: Colors.redAccent),
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
      appBar: AppBar(
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
