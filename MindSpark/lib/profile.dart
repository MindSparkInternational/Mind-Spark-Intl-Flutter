import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'test.dart';
import 'editProf.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = PageController(
    initialPage: 0,
  );
  bool dialVisible = true;
  String _currentName;
  final _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
                radius: 30.0,
              ),
              title: Text("Jane Doe"),
              trailing: FlatButton(
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)),
                  child: Text("Edit Profile")
                  ),
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 80),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {},
                    color: Colors.transparent,
                    textColor: Colors.black,
                    child: Text("Pioneer", style: TextStyle(fontSize: 14)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 60)),
                Align(
                    alignment: Alignment.topRight,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {},
                      textColor: Colors.black,
                      child:
                          Text("Another Role", style: TextStyle(fontSize: 14)),
                    ))
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 60, right: 8),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter about yourself",
                ),
              )),
          SizedBox(height: 10),
          Container(


            height: 50,
            child: 
         
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left:40)),
                      _getIconName(icon: Icons.link, title: 'www.example.com'),
                      _getIconName(icon: Icons.location_on, title: 'Country '),
                    ])
                     
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            children: <Widget>[
                              Text("577"),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Followers',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ))),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(children: <Widget>[
                            Text("577"),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Following',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ]))),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("8"),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Publications',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ]))),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("577"),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Bolts',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ])),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                ],
              ))
        ],
      ),
      SizedBox(
        height: 20,
      ),
    
      Container(
        height: 480,
        padding: EdgeInsets.all(20),
        color: Colors.limeAccent,
        // child:
        //   Card(
        child: PageView(
            controller: controller,
            onPageChanged: (page) => {print(page.toString())},
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            dragStartBehavior: DragStartBehavior.start,
            children: <Widget>[
              _pageviewone(context),
              _pageviewone(context),
              _pageviewone(context),
            ]),
        //  ),
      ),
      Divider(
        color: Colors.grey,
      ),
    ])));
  }
}

Widget _pageviewone(BuildContext context) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(width: 3, color: Colors.red),
      ),
      child: Column(children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text("Title for the article"),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
          radius: 85.0,
        ),
        SizedBox(
          height: 10,
        ),
        Flexible(
          child: Text(
            "      Lorem Ipsum has been the industry's gggrt \n      standard dummy text ever since the 1500s,\n      when an unknown printertook a galley of type\n     and scrambled it to make a type specimen .  ",
          ),
        ),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 7)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: null,
                      child: Text("biology"),
                    ),
                    Padding(padding: EdgeInsets.only(left: 18)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: null,
                      child: Text("biology"),
                    ),
                    Padding(padding: EdgeInsets.only(left: 18)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        //side: BorderSide(color: Colors.red)
                      ),
                      onPressed: null,
                      child: Text("biology"),
                    ),
                  ],
                ))),
        SizedBox(
          height: 18,
        ),
        Row(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: null,
              child: Text("Author Name"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 120),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: new FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.grey,
                  child: buildSpeedDial(),
                ))
          ],
        )
      ]),
    );

SpeedDial buildSpeedDial() {
  return SpeedDial(
    backgroundColor: Colors.grey,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 20.0),
    onOpen: () => print('OPENING DIAL'),
    children: [
      SpeedDialChild(
        child: Icon(Icons.thumb_up, color: Colors.white),
        backgroundColor: Colors.grey,
        label: 'Likes ',
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        labelBackgroundColor: Colors.grey,
      ),
      SpeedDialChild(
        child: Icon(Icons.share, color: Colors.white),
        backgroundColor: Colors.grey,
        label: 'Share ',
        labelStyle: TextStyle(fontWeight: FontWeight.w500),
        labelBackgroundColor: Colors.grey,
      ),
      SpeedDialChild(
        child: Icon(Icons.subject, color: Colors.white),
        backgroundColor: Colors.grey,
        label: 'Field ',
        labelBackgroundColor: Colors.grey,
      ),
      SpeedDialChild(
        child: Icon(Icons.video_library, color: Colors.white),
        backgroundColor: Colors.grey,
        label: 'Type ',
        labelBackgroundColor: Colors.grey,
      ),
    ],
  );
}
Widget _getIconName({String title, IconData icon}) {
  return Container(
         child: Row(children: [
        Icon(icon, size: 22.0, color: Colors.red),
        Padding(
          padding: EdgeInsets.all( 10.0),
          child: Text(title, style: TextStyle(fontSize: 14.0)),
        )
      ]));
}
