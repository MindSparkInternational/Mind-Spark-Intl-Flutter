
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:homescreen/createArticlepage.dart';
//import 'package:homescreen/video.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Homescreen"),
        ),
        body: Stack(
          children: <Widget>[
            //  Text("hjkghf"),
            ListView(
              physics: const AlwaysScrollableScrollPhysics(),

              padding: EdgeInsets.all(10),
              children: <Widget>[

                                     Container(
                    height: 450,
                    child: Card(
                      child:
                      _buidNewPage(),
                    )),
                //   Divider(),
                Container(
                  color: Colors.black,
                  height: 450,
                  child: _buidNewPage1(),
                ),
      
                Container(
                  color: Colors.black,
                  height: 450,
                  child: _buidNewPage3(),
                ),
              ],
            )
          ],
        ),

        );

    //  Card(child: Text("hello"),);
  }

  Widget _buidNewPage() => (
          // Container(
          //    color: Colors.black,

          //  child:
          PageView(
              physics: BouncingScrollPhysics(),
              controller: controller,
              onPageChanged: (page) =>
                  {print("Inside pageview"), print(page.toString())},
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(width: 3, color: Colors.red),
        ),
                child: Center(
              child: Icon(Icons.ac_unit),
            )),
            Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
           side: BorderSide(width: 3, color: Colors.red),
        ),
                child: Center(
              child: Icon(Icons.person),
            )),
            Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
           side: BorderSide(width: 3, color: Colors.red),
        ),
                child: Center(
              child: Icon(Icons.local_airport),
            )),
          ])
      //   )
      );
  Widget _buidNewPage1() => (PageView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (page) =>
              {print("Inside pageview2"), print(page.toString())},
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Card(
              // height: 100,
              child: pic(),
            ),
            Card(
              child: pic(),
            ),
            Card(
                child: Card(
              child: pic(),
            ))
          ]));
  Widget _buidNewPage3() => (PageView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (page) =>
              {print("Inside pageview3"), print(page.toString())},
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Card(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
           side: BorderSide(width: 3, color: Colors.blue),
        ),
              child: Text("Post"),
            ),
            Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
           side: BorderSide(width: 3, color: Colors.blue),
        ),
              child: Text("arll are post"),
            ),
            Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
           side: BorderSide(width: 3, color: Colors.blue),
        ),
                child: Card(
              child: Text(" post appear here"),
            ))
          ]));




Widget pic()=>  Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(width: 3, color: Colors.red),
        ),
      color: Colors.amber,
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
        

                  ]));


                  
         
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
        child:
      ListTile(
        title: Text('Create Post ',style: TextStyle(color: Colors.black),),
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
        child:
      ListTile(
        title: Text('Create Video',style: TextStyle(color: Colors.black),),
        trailing: Icon(Icons.video_library, color: Colors.black),
        /*onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoCreate()),
          );
        } ,*/

      ),),
    
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



