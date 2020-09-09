import 'package:MindSpark/articlePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'animations/FadeAnimation.dart';
import 'articlePage.dart';
import 'components/TagCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDark = false;
  final controller = PageController(
    initialPage: 0,
  );
  Color homeBarColor = Colors.red;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Hexcolor('#E5E5E5'),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/img/waveLight.png',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    height: 50,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add,
                            size: 50,
                            color: Hexcolor('#0F3460'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                child: Image.asset('assets/img/MindSpark.png')),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/img/Image1.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50.0, bottom: 10, left: 10, right: 10),
                    child: Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TagItem('Followed'),
                            TagItem('Followers'),
                            TagItem('Maths'),
                            TagItem('Biology'),
                            TagItem('Physics'),
                            TagItem('Chemistry'),
                            TagItem('Life Science'),
                            TagItem('Astronomy'),
                            TagItem('Data Science'),
                            TagItem('Robotics'),
                            TagItem('Programming'),
                            TagItem('Artificial Intelligence'),
                            TagItem('BreakThroughs'),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: LayoutBuilder(
                          builder: (BuildContext context,
                                  BoxConstraints constraints) =>
                              ListView(
                                controller: scrollController,
//              physics: const AlwaysScrollableScrollPhysics(),
//            padding: EdgeInsets.all(10),
                                children: <Widget>[
                                  Container(
                                      height: constraints.maxHeight,
                                      child: _buidNewPage()),
                                  Container(
                                    color: Colors.black,
                                    height: constraints.maxHeight,
                                    child: _buidNewPage1(),
                                  ),
//                                  Container(
//                                    color: Colors.black,
//                                    height: constraints.maxHeight,
//                                    child: _buidNewPage3(),
//                                  ),
                                ],
                              )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buidNewPage() => Container(
        color: Hexcolor('#E5E5E5'),
        child: (PageView(
                physics: BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (page) =>
                    {print("Inside pageview"), print(page.toString())},
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
              MyCard1(),
              MyCard1(),
              MyCard1(),
            ])
            //   )
            ),
      );
  Widget _buidNewPage1() => Container(
        child: (PageView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            onPageChanged: (page) =>
                {print("Inside pageview2"), print(page.toString())},
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              MyCard2(),
              MyCard2(),
              MyCard2(),
            ])),
      );
}

class MyCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FadeAnimation(
      0.25,
      Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Hexcolor('#E5E5E5')),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.0,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      "CLIMATE CHANGE, NOT HUNTERS, MAY HAVE KILLED OFF WOOLLY RHINOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Hexcolor('#FFFFFF'),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 1, left: 8, right: 8),
                              child: Container(child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: constraints.maxHeight * 0.55,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.asset(
                                            'assets/img/Image2.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      ArticleDetails(),
//                                      Divider(
//                                        thickness: 0.2,
//                                        color: Colors.white,
//                                      ),
                                      Expanded(
                                        child: Container(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0,
                                                  vertical: 10),
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          height: constraints.maxHeight * 0.2,
                                        ),
                                      ),
//                                      Divider(
//                                        thickness: 0.2,
//                                        color: Colors.white,
//                                      ),
                                    ],
                                  ),
                                );
                              })),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: LayoutBuilder(builder:
                                    (BuildContext context,
                                        BoxConstraints constraints) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ArticleScreen();
                                      }));
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * 0.5,
                                      decoration: BoxDecoration(
                                          color: Hexcolor('#1F415F'),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text('View Article',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )));
}

class ArticleDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 3),
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: Text(
                        'Brian Wamwea',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, top: 3),
                  child: Container(
                      margin: EdgeInsets.all(3),
                      child: Text(
                        '03/25/2010',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  ArticleTag(),
                  ArticleTag(),
                  ArticleTag(),
                ],
              ),
            ),
          ],
        ),
      );
}

class ArticleTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 6.0, bottom: 5),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: Text(
              "Subject",
              style: TextStyle(color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              color: Hexcolor('#FBD772'),
              borderRadius: BorderRadius.circular(30)),
        ),
      );
}

class MyCard2 extends StatefulWidget {
  @override
  _MyCard2State createState() => _MyCard2State();
}

class _MyCard2State extends State<MyCard2> {
  String sampletext =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  bool showFullCaption = false;
  bool isTapped = false;
  bool commentTapped = false;

  @override
  Widget build(BuildContext context) => FadeAnimation(0.25, LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Container(
            decoration: BoxDecoration(
                color: Hexcolor('#E5E5E5'),
                borderRadius: BorderRadius.circular(3)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                  child: Container(
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Climate Change,Not hunters, may have caused the extinction of wooly rhinos',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Hexcolor('#FBD772'),
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 1, left: 8, right: 8),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child: Icon(Icons.face),
                                                  radius: 15,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Text(
                                                      'Brian Wamwea',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                child: Container(
                                                    child: Padding(
                                              padding:
                                                  const EdgeInsets.all(7.0),
                                              child: Text(
                                                '11:53AM, 12-3-2020',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          width: constraints.maxWidth * 0.9,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: Image.asset(
                                              'assets/img/Image1.png',
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2.0,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [Text('Share')],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.comment),
                                                    Text('Comment')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.bookmark),
                                                    Text('Save')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    PostTags(),
                                                    PostTags(),
                                                    PostTags(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    LikesBar(),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    SaveBar()
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          showFullCaption
                              ? Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showFullCaption = false;
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: SingleChildScrollView(
                                              child: Text(
                                            sampletext,
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                bottom: 8,
                                                left: 8,
                                                right: 8),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  showFullCaption = true;
                                                });
                                              },
                                              child: Container(
                                                height:
                                                    constraints.maxHeight * 0.1,
                                                width: constraints.maxWidth,
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      '$sampletext',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2, left: 8, right: 8),
                                            child: Container(
                                                height:
                                                    constraints.maxHeight * 0.2,
                                                width: constraints.maxWidth,
                                                child: ListView(
                                                  children: [
                                                    CommentBox(),
                                                    CommentBox(),
                                                    CommentBox(),
                                                    CommentBox(),
                                                    CommentBox(),
                                                    CommentBox(),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }));
}

class CommentBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 4, top: 2),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.face,
              ),
              radius: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '11:53PM 12/5/2019',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Lkhsd aslknasd klndsa kajn dakdsj nfasdlkj fnasdkj nasdkj fnasdkj fnasd kjnads kljna sdkljna dskj asdkjas dnask ljnasd na sdkljnas kjlna sdkjlna dskjn as',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostTags extends StatelessWidget {
  const PostTags({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          child: Text('Tag'),
        ),
      ),
    );
  }
}

class SaveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.thumb_down,
        color: Colors.black,
      ),
    );
  }
}

class LikesBar extends StatelessWidget {
  const LikesBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: Colors.black,
          ),
          Text(
            ' 25',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
        ),
        // color: Hexcolor("#1f405e"),
        child: ListTile(
          title: Text(
            'Create Post ',
            style: TextStyle(color: Colors.black),
          ),
          trailing: Icon(Icons.photo_size_select_small, color: Colors.black),
          /*
        onTap: (){
          Navigator.push(
            context,
            //MaterialPageRoute(builder: (context) => MyPost()),
          );
        },
        */
        ),
      ),
      Card(
        // color: Hexcolor("#1f405e"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          //side: BorderSide(width: 2, color: Hexcolor("#60aaa1"),),
        ),
        child: ListTile(
          title: Text(
            'Create Video',
            style: TextStyle(color: Colors.black),
          ),
          trailing: Icon(Icons.video_library, color: Colors.black),
          /*onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoCreate()),
          );
        } ,*/
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

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        // backgroundColor: Hexcolor("#0d1822"),
        // appBar: AppBar(
        //    backgroundColor: Hexcolor("#19222c"),
        //   title: Text("Settings Details"),

        // ),
        // body:
        AnimatedList(
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
      // ),
    );
  }
}
