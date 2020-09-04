import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';

import 'articlePage.dart';
import 'generalsetting.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState(){
    // TODO: implement 
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    //var token = preferences.getString("token");
    //print(token);
    getToken();
    super.initState();
  }
  void getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    //return token;
  }
  
  final controller = PageController(
    initialPage: 0,
  );

  //bool dialVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor("#0d1822"),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: Hexcolor("#19222c"),
                  child: ExpansionTile
                      //  ListTile

                      (
                    //backgroundColor: Hexcolor("#19222c"),
                    backgroundColor: Hexcolor("#19222c"),
                    leading: GestureDetector(
                      onTap: () => Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HeroDetail(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      )),
                      child:
                          // InkWell(
                          // child:
                          CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
                        radius: 30.0,
                      ),
                    ),
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DragabbleScrollableSheetDemo()
                              // ArticlePage()
                              ),
                        );
                      },
                      child: Text(
                        "Jane Doe",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: FlatButton(
                        onPressed: () async{
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          var token = preferences.getString("token");
                          print(token);
                          getToken();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageWithAnimatedList()),
                          );
                        },
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        )),
                    children: <Widget>[
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
                                    side: BorderSide(color: Hexcolor("#60aaa1"),
                                    )
                                    ),
                                onPressed: () {},
                                color: Hexcolor("#1f405e"),
                                textColor: Colors.white,
                                child: Text("Pioneer",
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Align(
                                alignment: Alignment.topRight,
                                child: RaisedButton(
                                  color: Hexcolor("#1f405e"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Hexcolor("#60aaa1"),),),
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  child: Text("Another Role",
                                      style: TextStyle(fontSize: 14)),
                                ))
                          ],
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30, right: 6),
                          child: 
                          TextField(
                            autofocus: false,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                            decoration: InputDecoration(
                             border: InputBorder.none,
                              hintText: 'Enter About yourself',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              // helperText: 'Report',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Hexcolor("#60aaa1"),),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          // TextField(
                          //   style: TextStyle(color: Colors.white),
                          //   // cursorColor: Colors.redAccent,
                          //   decoration: InputDecoration(
                          //     // contentPadding: const EdgeInsets.all(8.0),
                          //     border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(20.0),
                          //         borderSide: BorderSide(color:Hexcolor("#060aaa1"),)),
                          //     //hoverColor: Colors.redAccent,
                          //     //fillColor: Colors.red,
                          //     hintText: "Enter about yourself",
                          //     hintStyle: TextStyle(
                          //       color: Colors.white,
                          //       //backgroundColor:Colors.white,
                          //       decorationColor: Colors.white,
                          //     ),
                          //   ),
                          // )
                          ),
                      SizedBox(height: 10),

                      Container(
                          height: 50,
                          child: Row(children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 40)),
                            _getIconName(
                                icon: Icons.link, title: 'www.example.com'),
                            _getIconName(
                                icon: Icons.location_on, title: 'Country '),
                          ])),


                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Hexcolor("#1f405e"),
                                        border: Border.all(
                                         color: Hexcolor("#60aaa1"),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Column(
                                      children: <Widget>[
                                        Text("577",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Followers',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Hexcolor("#1f405e"),
                                        border: Border.all(
                                        color: Hexcolor("#60aaa1"),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Column(children: <Widget>[
                                      Text("577",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Following',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ]))),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Hexcolor("#1f405e"),
                                        border: Border.all(
                                          color: Hexcolor("#60aaa1"),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text("8",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              'Publications',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ]))),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Hexcolor("#1f405e"),
                                      border: Border.all(
                                      color: Hexcolor("#60aaa1"),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("577",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Bolts',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ])),
                            ),
                          //  Padding(padding: EdgeInsets.only(left: 5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 480,
             padding: EdgeInsets.all(10),

              // decoration: new BoxDecoration(
              //   boxShadow: [
              //     new BoxShadow(
              //       color: Colors.red,
              //       blurRadius: 20.0,
              //     ),
              //   ],
              // ),
              //color: Color(0x19222c),
              //Colors.limeAccent,
              // child:
              //   Card(
              child: PageView(
                  controller: controller,
                  onPageChanged: (page) => {print(page.toString())},
                  pageSnapping: true,
                  scrollDirection: Axis.vertical,
                  dragStartBehavior: DragStartBehavior.start,
                  children: <Widget>[
                    Pagetwo(),
                    Pagetwo(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
//#60aaa1
Widget _getIconName({String title, IconData icon}) {
  return Container(
      child: Row(children: [
    Icon(icon, size: 22.0, color: Hexcolor("#60aaa1"),),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(title, style: TextStyle(fontSize: 14.0, color: Colors.white)),
    )
  ]));
}

class HeroDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor("#0d1822"),
      appBar: AppBar(
         backgroundColor: Hexcolor("#19222c"),
        title: Text('Your Profile Picture'),
      ),
      body: Container(
          height: 500,
          width: 500,

          //color: Colors.amber,
          child: Center(
              child: Hero(
            tag: 'myImage',
            child: ClipOval(
              child: new SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.network(
                  'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ))),
    );
  }
}

class Pagetwo extends StatefulWidget {
  @override
  _PagetwoState createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: 
      Container(
            decoration: BoxDecoration(
    //border: Border.all(
      //color: Colors.red[500],
    //),
    borderRadius: BorderRadius.all(Radius.circular(20))
  ), 
        child:
      Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(width: 3, color: Colors.red),
        ),
        color: Hexcolor("#19222c"),
        child: 
        Column(children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            "Title for the article",
            style: TextStyle(color: Colors.white),
          ),
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
              "      Lorem Ipsum has been the industry's  \n      standard dummy text ever since the \n      when an unknown printertook a galley  \n      and scrambled it to make a type.  ",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(10)),
                      RaisedButton(
                        color: Hexcolor("#1f405e"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () => {},
                        child: Text("biology",
                            style: TextStyle(color: Colors.white)),
                      ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                      RaisedButton(
                        color: Hexcolor("#1f405e"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () => {},
                        child: Text("biology",
                            style: TextStyle(color: Colors.white)),
                      ),
                       Padding(padding: EdgeInsets.only(right: 10)),
                      RaisedButton(
                        color: Hexcolor("#1f405e"),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Hexcolor("#60aaa1"),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          //side: BorderSide(color: Colors.red)
                        ),
                        onPressed: () => {},
                        child: Text(
                          "biology",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(
            height: 18,
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              FlatButton(
                 color: Hexcolor("#1f405e"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Hexcolor("#60aaa1")
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: ()=>{},
                child: Text(
                  "Author Name",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 95, bottom: 5),
              ),
            ],
          ),
        ]),
      )),
      floatingActionButton: SpeedDial(
        backgroundColor: Hexcolor("#60aaa1"),
        overlayColor: Colors.transparent,
        foregroundColor: Hexcolor("#1f405e"),
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 20.0),
        onOpen: () => print('OPENING DIAL'),
        children: [
          SpeedDialChild(
            child: Icon(Icons.thumb_up, color: Colors.white),
            backgroundColor: Hexcolor("#1f405e"),
            label: 'Likes ',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Hexcolor("#1f405e"),
          ),
          SpeedDialChild(
            child: Icon(Icons.share, color: Colors.white),
            backgroundColor: Hexcolor("#1f405e"),
            label: 'Share ',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Hexcolor("#1f405e"),
          ),
          SpeedDialChild(
            child: Icon(Icons.subject, color: Colors.white),
            backgroundColor: Hexcolor("#1f405e"),
            label: 'Field ',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Hexcolor("#1f405e"),
          ),
          SpeedDialChild(
            child: Icon(Icons.video_library, color: Colors.white),
            backgroundColor: Hexcolor("#1f405e"),
            label: 'Type ',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Hexcolor("#1f405e"),
          ),
        ],
      ),
    );
  }
}
