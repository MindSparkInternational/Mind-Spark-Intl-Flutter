import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  Map data;
  ArticlePage({this.data});
  @override
  _ArticlePageState createState() => _ArticlePageState(data);
}

class _ArticlePageState extends State<ArticlePage> {
  Map data;
  _ArticlePageState(this.data);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(color: Colors.greenAccent),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          onTap: () {},
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 11, right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(11.0),
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 19,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 21),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "INDOOR",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 21,
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: (MediaQuery.of(context).size.height / 2) - 23,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 21.0,
                          ),
                          Text("Test fr", style: TextStyle(fontSize: 17))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}