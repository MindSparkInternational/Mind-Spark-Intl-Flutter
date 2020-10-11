import 'package:MindSpark/signAndLogStuff/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit.dart';
import 'report.dart';

class ProfieSettings extends StatefulWidget {
  @override
  _ProfieSettingsState createState() => _ProfieSettingsState();
}

class _ProfieSettingsState extends State<ProfieSettings> {
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
          side: BorderSide(
            width: 2,
            color: Hexcolor("#60aaa1"),
          ),
        ),
        child: ListTile(
          title: Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
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
          side: BorderSide(
            width: 2,
            color: Hexcolor("#60aaa1"),
          ),
        ),
        color: Hexcolor("#1f405e"),
        child: ListTile(
          title: Text(
            'Theme dark and Light ',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.lightbulb_outline, color: Colors.white),
          onTap: null,
        ),
      ),
      Card(
        color: Hexcolor("#1f405e"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 2,
            color: Hexcolor("#60aaa1"),
          ),
        ),
        child: ListTile(
          title: Text(
            'Report issues',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.report_problem, color: Colors.white),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportClass()),
            );
          },
        ),
      ),
      Card(
        color: Hexcolor("#1f405e"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 2,
            color: Hexcolor("#60aaa1"),
          ),
        ),
        child: ListTile(
          title: Text(
            'Logout ',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(Icons.exit_to_app, color: Colors.white),
          onTap: () async{
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.remove("token");
            preferences.remove("email");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    ];

    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _animatedlistItems.add(fetchedList[i]);
          _animatedlistKey.currentState
              .insertItem(_animatedlistItems.length - 1);
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
