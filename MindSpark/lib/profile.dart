import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'test.dart';
import 'editProf.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = PageController(
    initialPage: 0,
  );
  String _currentName;
  final _nameController = TextEditingController();
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child:EditProfile()
              // Column(
              //   children: <Widget>[
              //     Text("Edit your Personal Information"),
              //   ],
             // )
              );
        });
  }

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
              title: TextFormField(),
              trailing: FlatButton(
                  onPressed: () {
                  //  displayBottomSheet(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.red)),
                  child: Text("Edit Profile")),
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
              padding: EdgeInsets.only(left: 80, right: 8),
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
            height: 100,
            child: Padding(
                padding: EdgeInsets.only(left: 60),
                child: GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 4),
                    crossAxisCount: 2,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.link,
                          color: Colors.red,
                        ),
                        title: TextField(),
                        //  ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.date_range,
                          color: Colors.red,
                        ),
                        title: TextField(),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.red),
                        title: TextField(),
                      ),
                      ListTile(
                        leading: Icon(Icons.cake, color: Colors.red),
                        title: TextField(),
                      ),
                    ])),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 60),
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
      Divider(
        color: Colors.grey,
      ),
      Container(
        height: 350,
        color: Colors.indigo,
        child: Card(
          child: PageView(
              controller: controller,
              onPageChanged: (page) => {print(page.toString())},
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              dragStartBehavior: DragStartBehavior.start,
              children: <Widget>[
                _pageviewone(context),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 20)),
                    // _getIconName(icon: Icons.person, title: 'Name '),
                    // _getIconName(icon: Icons.thumb_up, title: 'Likes'),
                    // _getIconName(icon: Icons.share, title: 'Share'),
                    // _getIconName(icon: Icons.subject, title: 'Field'),
                    // _getIconName(icon: Icons.video_library, title: 'Type'),
                  ],
                )
              ]),
        ),
      ),
      Divider(
        color: Colors.grey,
      ),
      Container(
          height: 280,
          color: Colors.indigo,
          child: Card(
            child: PageView(
                controller: controller,
                onPageChanged: (page) => {print(page.toString())},
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                dragStartBehavior: DragStartBehavior.start,
                children: <Widget>[
                  _pageviewone(context),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20)),
                      // _getIconName(icon: Icons.person, title: 'Name '),
                      // _getIconName(icon: Icons.thumb_up, title: 'Likes'),
                      // _getIconName(icon: Icons.share, title: 'Share'),
                      // _getIconName(icon: Icons.subject, title: 'Field'),
                      // _getIconName(icon: Icons.video_library, title: 'Type'),
                    ],
                  )
                ]),
          )),
    ])));
  }
}

Widget _pageviewone(BuildContext context) => Container(
      child: Column(children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text("Title"),
        SizedBox(
          height: 10,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
          radius: 30.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(" the detailed article"),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: null,
                      child: Text("biology"),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: null,
                      child: Text("biology"),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
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
               // SizedBox(height: 20,),
        Row(
          children: <Widget>[ 
             Padding(padding: EdgeInsets.only(left:20)),
            _getIconName(icon: Icons.person, title: 'Name '),
            _getIconName(icon: Icons.thumb_up, title: 'Likes'),
            _getIconName(icon: Icons.share, title: 'Share'),
            _getIconName(icon: Icons.subject, title: 'Field'),
            _getIconName(icon: Icons.video_library, title: 'Type'),
          ],
        )
      ]),
    );

Widget _getIconName({String title, IconData icon}) {
  return Container(
     // margin: EdgeInsets.only(top: 20.0),
      width: 60.0,
      height: 60.0,
      child: Column(children: [
        Icon(icon, size: 20.0, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: Text(title, style: TextStyle(fontSize: 10.0)),
        )
      ]));
}
