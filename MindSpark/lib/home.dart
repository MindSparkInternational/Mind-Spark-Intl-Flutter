import 'package:MindSpark/aboutUs.dart';
import 'package:MindSpark/dataClasses/comment.dart';
import 'package:MindSpark/dataClasses/diffUser.dart';
import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/models/articleModel.dart';
import 'package:MindSpark/models/postModel.dart';
import 'package:MindSpark/profile.dart';
import 'package:MindSpark/signAndLogStuff/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'components/TagCard.dart';
import 'components/PostCard.dart';
import 'components/ArticleCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/create.dart';

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
    print("home");
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Hexcolor('#E5E5E5'),
        body: SafeArea( 
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 5,
                child: Image.asset(
                  'assets/img/waveLight.png',
                  fit: BoxFit.fill
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
                          GestureDetector(
                            child: Icon(
                              Icons.add,
                              size: 50,
                              color: Hexcolor('#0F3460'),
                            ),
                            onTap: () async{
                              
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePost()));

                            }
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: AboutUs(),
                                      type: PageTransitionType.downToUp,
                                      duration: Duration(milliseconds: 400)));
                              },
                              child: Container(
                                child: Image.asset('assets/img/MindSpark.png')),
                              )
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
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 50.0, bottom: 10, left: 10, right: 10),
                  //   child: Container(
                  //       height: 40,
                  //       child: ListView(
                  //         scrollDirection: Axis.horizontal,
                  //         children: [
                  //           TagItem('Followed'),
                  //           TagItem('Followers'),
                  //           TagItem('Maths'),
                  //           TagItem('Biology'),
                  //           TagItem('Physics'),
                  //           TagItem('Chemistry'),
                  //           TagItem('Life Science'),
                  //           TagItem('Astronomy'),
                  //           TagItem('Data Science'),
                  //           TagItem('Robotics'),
                  //           TagItem('Programming'),
                  //           TagItem('Artificial Intelligence'),
                  //           TagItem('BreakThroughs'),
                  //         ],
                  //       )),
                  // ),
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
    child: Consumer<ArticleModel>(builder: (context, articleModel, child) {
      return new PageView.builder(
      itemCount: articleModel.articles.length,
      itemBuilder: (context, index){
        String id = Provider.of<ArticleModel>(context, listen: true).articles[index].id;
        String author = Provider.of<ArticleModel>(context, listen: true).articles[index].author;
        String title = Provider.of<ArticleModel>(context, listen: true).articles[index].title;
        String subHead = Provider.of<ArticleModel>(context, listen: true).articles[index].subHead;
        String body = Provider.of<ArticleModel>(context, listen: true).articles[index].body;
        String authorId = Provider.of<ArticleModel>(context, listen: true).articles[index].authorId;
        int likes = Provider.of<ArticleModel>(context, listen: true).articles[index].likes;
        List<dynamic> fields = Provider.of<ArticleModel>(context, listen: true).articles[index].fields;
        String date = Provider.of<ArticleModel>(context, listen: true).articles[index].date;
        List<Comment> comments = Provider.of<ArticleModel>(context, listen: true).articles[index].finalComments;
        List<dynamic> medias =  Provider.of<ArticleModel>(context, listen: true).articles[index].medias;
        DiffUser diffUser = Provider.of<ArticleModel>(context, listen: true).articles[index].diffUser;
        print("THIS IS A DIFF USER TEST ${diffUser.posts.length}");
        return 
        ArticleCard(diffUser: diffUser ,authorId: authorId,author: author, title: title, body: body, likes: likes, comments: comments, date:date ,fields: fields,subHead: subHead, medias: medias, id:id);

        //ArticleCard
      });
    },)
        // color: Hexcolor('#E5E5E5'),
        // child: (PageView(
        //         physics: BouncingScrollPhysics(),
        //         controller: controller,
        //         onPageChanged: (page) =>
        //             {print("Inside pageview"), print(page.toString())},
        //         pageSnapping: true,
        //         scrollDirection: Axis.horizontal,
        //         children: <Widget>[
        //       ArticleCard(),
        //       ArticleCard(),
        //       ArticleCard(),
        //     ])
        //     //   )
        //     ),
      );
  Widget _buidNewPage1() => Container(
    color: Hexcolor('#E5E5E5'),
    child: Consumer<PostModel>(builder: (context, postModel, child) {
      return new PageView.builder(
      itemCount: postModel.posts.length,
      itemBuilder: (context, index){
        String author = Provider.of<PostModel>(context, listen: true).posts[index].author;
        String id = Provider.of<PostModel>(context, listen: true).posts[index].id;
        String title = Provider.of<PostModel>(context, listen: true).posts[index].title;
        String body = Provider.of<PostModel>(context, listen: true).posts[index].body;
        int likes = Provider.of<PostModel>(context, listen: true).posts[index].likes;
        List<dynamic> fields = Provider.of<PostModel>(context, listen: true).posts[index].fields; 
        String date = Provider.of<PostModel>(context, listen: true).posts[index].date;
        List<Comment> comments = Provider.of<PostModel>(context, listen: true).posts[index].finalComments;
        List<dynamic> medias =  Provider.of<PostModel>(context, listen: true).posts[index].medias;
        DiffUser diffUser = Provider.of<PostModel>(context, listen: true).posts[index].diffUser;
        return MyCard2(inSecond: false,diffUser: diffUser,author: author, title: title, body: body, likes: likes, comments: comments, date:date, medias: medias, fields: fields, id:id );
      });
    },)
    
        // child: (PageView(
        //     physics: BouncingScrollPhysics(),
        //     controller: controller,
        //     onPageChanged: (page) =>
        //         {print("Inside pageview2"), print(page.toString())},
        //     pageSnapping: true,
        //     scrollDirection: Axis.horizontal,
        //     children: <Widget>[
        //       MyCard2(),
        //       MyCard2(),
        //       MyCard2(),
        //     ])),
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
