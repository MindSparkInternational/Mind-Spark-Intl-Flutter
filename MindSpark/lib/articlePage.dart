import 'package:MindSpark/components/TagCard.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            color: Hexcolor('#E5E5E5'),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: constraints.maxHeight * 0.05,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left)),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.face,
                                          size: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Brian Wamwea",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "Friday 12 May 2020",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Text(
                                    'Climate Change, Not Hunters, May Have Killed off Woolly Rhinos',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ArticleTagItem('History'),
                                            ArticleTagItem('Math'),
                                            ArticleTagItem('Science'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.thumb_up),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.thumb_down),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.bookmark),
                                                  Text('Save'),
                                                ],
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.share),
                                                  Text('Share'),
                                                ],
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.comment),
                                                  Text('Comment'),
                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.35,
                                width: constraints.maxWidth,
                                color: Colors.red,
                                child: Image.asset(
                                  "assets/img/Image1.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Container(
                                          child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                        textAlign: TextAlign.justify,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0, vertical: 5),
                                      child: Container(
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Sit amet venenatis urna cursus eget nunc. Pharetra vel turpis nunc eget. Eleifend mi in nulla posuere sollicitudin. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Netus et malesuada fames ac turpis egestas sed tempus urna. Pharetra vel turpis nunc eget lorem dolor. Feugiat sed lectus vestibulum mattis ullamcorper velit. Cursus in hac habitasse platea dictumst. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Volutpat lacus laoreet non curabitur gravida arcu ac. Molestie a iaculis at erat. Sem et tortor consequat id porta nibh. Elementum eu facilisis sed odio morbi quis commodo. Pretium fusce id velit ut tortor.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit. Justo donec enim diam vulputate ut pharetra sit amet. Sit amet venenatis urna cursus eget nunc. Pharetra vel turpis nunc eget. Eleifend mi in nulla posuere sollicitudin. Natoque penatibus et magnis dis parturient montes nascetur ridiculus. Netus et malesuada fames ac turpis egestas sed tempus urna. Pharetra vel turpis nunc eget lorem dolor. Feugiat sed lectus vestibulum mattis ullamcorper velit. Cursus in hac habitasse platea dictumst. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Volutpat lacus laoreet non curabitur gravida arcu ac. Molestie a iaculis at erat. Sem et tortor consequat id porta nibh. Elementum eu facilisis sed odio morbi quis commodo. Pretium fusce id velit ut tortor.",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
