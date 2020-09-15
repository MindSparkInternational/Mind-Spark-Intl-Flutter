import 'package:MindSpark/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'components/TagCard.dart';
import 'components/PostCard.dart';
import 'components/ArticleCard.dart';

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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: Profile(),
                                      type: PageTransitionType.downToUp,
                                      duration: Duration(milliseconds: 400)));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/img/Image1.png',
                                fit: BoxFit.fitWidth,
                              ),
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
              ArticleCard(),
              ArticleCard(),
              ArticleCard(),
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
