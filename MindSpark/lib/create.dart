import 'package:flutter/material.dart';

void main() => runApp(new Create());

class Create extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("Create")
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
                DrawerHeader(
                    child: Text("Header"),
                  ),
                ListTile(
                    title: Text("Home"),
                  )
              ],
            ),
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text("Create")
              ],
            ),
          ),
        ),
      ),
    );
  }
}