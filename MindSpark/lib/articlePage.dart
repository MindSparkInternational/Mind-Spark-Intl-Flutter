import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';
class DragabbleScrollableSheetDemo extends StatefulWidget {
  Map data;
  DragabbleScrollableSheetDemo({this.data});
  @override
  _DragabbleScrollableSheetDemoState createState() =>
      _DragabbleScrollableSheetDemoState(data);
}

class _DragabbleScrollableSheetDemoState
    extends State<DragabbleScrollableSheetDemo> {
  Map data;
  _DragabbleScrollableSheetDemoState(this.data);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(title:Text("Article Page")),
         backgroundColor: Hexcolor("#0d1822"),
        body: SafeArea(
            child: Stack(
              
      children: <Widget>[
        Container(

          padding: EdgeInsets.all(20),
          color: Hexcolor("#19222c"), 
            child: Column(children: <Widget>[
              Row(children: <Widget>[

                FlatButton(
                  color: Hexcolor("#1f405e"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Hexcolor("#60aaa1")
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                  onPressed: null, child: Text("Author Name", style: TextStyle(color:Colors.white),)),
                  Padding(padding: EdgeInsets.all(3)),
                FlatButton(
                  color: Hexcolor("#1f405e"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Hexcolor("#60aaa1")
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                  onPressed: null, child: Text("Subject",style: TextStyle(color:Colors.white),)),
                  Padding(padding: EdgeInsets.all(3)),
                FlatButton(
                  color: Hexcolor("#1f405e"),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Hexcolor("#60aaa1")
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                  onPressed: null, child: Text("Date",style: TextStyle(color:Colors.white),)),
              ],),
           Text("Title for Article",style: TextStyle(fontSize: 20,color: Colors.white)),
           SizedBox(height: 10,),
      
         Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://picsum.photos/250?image=9"),
              ),
            ),
          ),
        ]
        )
        ),
        
      _drag(context),
      ],
    )));
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
     backgroundColor: Hexcolor("#60aaa1"),
overlayColor: Hexcolor("#19222c"),
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 20.0),
      onOpen: () => print('OPENING DIAL'),
      children: [
        SpeedDialChild(
          child: Icon(Icons.thumb_up, color: Colors.white),
          backgroundColor: Hexcolor("#1f405e"),
          label: 'Likes ',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Hexcolor("#1f405e"),
        ),
        SpeedDialChild(
          child: Icon(Icons.share, color: Colors.white),
          backgroundColor: Hexcolor("#1f405e"),
          label: 'Share ',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Hexcolor("#1f405e"),
        ),
        SpeedDialChild(
          child: Icon(Icons.subject, color: Colors.white),
          backgroundColor: Hexcolor("#1f405e"),
          label: 'Field ',
          labelBackgroundColor: Hexcolor("#1f405e"),
        ),
        SpeedDialChild(
          child: Icon(Icons.video_library, color: Colors.white),
          backgroundColor: Hexcolor("#1f405e"),
          label: 'Type ',
          labelBackgroundColor:Hexcolor("#1f405e"),
        ),
      ],
    );
  }

  Widget _drag(BuildContext context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
       minChildSize: 0.25,
        maxChildSize: 0.9,
        //expand: true,
        
        builder: (BuildContext context, myscrollController) {
          return Container(
            
            // color: Colors.tealAccent[200],
            decoration: BoxDecoration(
               color: Hexcolor("#19222c"),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),

            child: ListView(controller: myscrollController, children: <Widget>[
              Card(
                  color: Hexcolor("#19222c"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  //  side: BorderSide(width: 2, color: Colors.grey),
                ),
                child: Column(
                  
                  children: <Widget>[
                     SizedBox(
                      //height: 10,
                    child:
                    Text("Subtitle for the article  atricle ypically leaves patients with little over tients with little",
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 20,
                      color: Colors.white
                      ),
  overflow: TextOverflow.ellipsis,
  maxLines: 2,),),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
                      radius: 85.0,
                    ),
                   SizedBox(
                         child: Text(
'Glioblastoma, a rare but deadly brain cancer, typically leaves patients with little over a year to fight for their lives. Thousands of patients die every year as a mere 5% of patients are fortunate enough to live more than 5 years upon diagnosis. 5 years ago, there would be no treatment for an illness as such, but through countless hours of research, scientists have come up with a vaccine that targets and boosts the body’s immune system to help fight the tumor cells. While the researchers and scientists are often credited for creating life changing vaccines as such, their work would never be possible without careful testing on animals. Using animals for research purposes has been a topic of debate for many decades, with nearly 44 percent of adult Americans being against it in 2016, claiming that it is “morally wrong”. While the number of people against animal testing continues to rise, the need for such measures is greater than ever, and it is now that proponents of animal testing must stand-up. ',
style: TextStyle(color: Colors.white),
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  maxLines: 9,
             
            ),
        
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: new FloatingActionButton(
                          onPressed: null,
                          backgroundColor: Hexcolor("#19222c"),
                          child: buildSpeedDial(),
                        ))
                  ],
                ),
              )
           
            ]),
     
          );
        },
      );
}



// class DragSheet extends StatefulWidget {
//   @override
//   _DragSheetState createState() => _DragSheetState();
// }

// class _DragSheetState extends State<DragSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DraggableScrollableSheet(
//         initialChildSize: 0.5,
//        minChildSize: 0.25,
//         maxChildSize: 0.9,
//         //expand: true,
        
//         builder: (BuildContext context, myscrollController) {
//           return Container(
            
//             // color: Colors.tealAccent[200],
//             decoration: BoxDecoration(
//              //  color: Hexcolor("#19222c"),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 )),

//             child: ListView(controller: myscrollController, children: <Widget>[
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   //  side: BorderSide(width: 2, color: Colors.grey),
//                 ),
//                 child: Column(
                  
//                   children: <Widget>[
//                      SizedBox(
//                       //height: 10,
//                     child:
//                     Text("Subtitle for the article  atricle ypically leaves patients with little over tients with little",
//                       textAlign: TextAlign.center,style: TextStyle(fontSize: 20),
//   overflow: TextOverflow.ellipsis,
//   maxLines: 2,),),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg'),
//                       radius: 85.0,
//                     ),
//                    SizedBox(
//                          child: Text(
// 'Glioblastoma, a rare but deadly brain cancer, typically leaves patients with little over a year to fight for their lives. Thousands of patients die every year as a mere 5% of patients are fortunate enough to live more than 5 years upon diagnosis. 5 years ago, there would be no treatment for an illness as such, but through countless hours of research, scientists have come up with a vaccine that targets and boosts the body’s immune system to help fight the tumor cells. While the researchers and scientists are often credited for creating life changing vaccines as such, their work would never be possible without careful testing on animals. Using animals for research purposes has been a topic of debate for many decades, with nearly 44 percent of adult Americans being against it in 2016, claiming that it is “morally wrong”. While the number of people against animal testing continues to rise, the need for such measures is greater than ever, and it is now that proponents of animal testing must stand-up. ',
//   textAlign: TextAlign.center,
//   overflow: TextOverflow.ellipsis,
//   maxLines: 9,
             
//             ),
        
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     // Align(
//                     //     alignment: Alignment.bottomRight,
//                     //     child: new FloatingActionButton(
//                     //       onPressed: null,
//                     //       backgroundColor: Colors.grey,
//                     //       child: buildSpeedDial(),
//                     //     ),
//                       //  )
//                   ],
//                 ),
//               )
           
//             ]),
     
//           );
//         },
//       ),
//       floatingActionButton: SpeedDial(
//          //   backgroundColor: Hexcolor("#60aaa1"),
//           //    overlayColor: Colors.transparent,
//       //  foregroundColor: Hexcolor("#1f405e"),
//       animatedIcon: AnimatedIcons.menu_close,
//       animatedIconTheme: IconThemeData(size: 20.0),
//       onOpen: () => print('OPENING DIAL'),
//       children: [
//         SpeedDialChild(
//           child: Icon(Icons.thumb_up, color: Colors.white),
//            backgroundColor: Hexcolor("#1f405e"),
//           label: 'Likes ',
//           labelStyle: TextStyle(fontWeight: FontWeight.w500),
//           labelBackgroundColor: Hexcolor("#1f405e"),
//         ),
//         SpeedDialChild(
//           child: Icon(Icons.share, color: Colors.white),
//           backgroundColor: Hexcolor("#1f405e"),
//           label: 'Share ',
//           labelStyle: TextStyle(fontWeight: FontWeight.w500),
//           labelBackgroundColor: Hexcolor("#1f405e"),
//         ),
//         SpeedDialChild(
//           child: Icon(Icons.subject, color: Colors.white),
//           backgroundColor: Colors.grey,
//           label: 'Field ',
//           labelBackgroundColor: Colors.grey,
//         ),
//         SpeedDialChild(
//           child: Icon(Icons.video_library, color: Colors.white),
//           backgroundColor: Colors.grey,
//           label: 'Type ',
//           labelBackgroundColor: Colors.grey,
//         ),
//       ],
//     )
//     );
//   }
// }