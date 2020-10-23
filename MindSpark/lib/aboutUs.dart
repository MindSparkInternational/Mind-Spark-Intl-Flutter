import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xff19222c),
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              heightFactor: 0.6,
              child: Image.asset("assets/img/MindSparkFull.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Connect to STEM better through the sharing of blurbs, articles, illustrations, and media to a community of like-minded individuals! Mind Spark aims to promote ingenuity and creative thinking in STEM through student narratives. With over 4.2k hits in more than 15 countries and 11 states, Mind Spark encourages students passionate about STEM to publish their thoughts and ideas related to their passion for our platform. Our current goal is to impact and reach 1,000 active users in our application by the end of the year, and we hope you can be a part of our strong community of science-driven individuals.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Our app features a unique, at the same time, a natural browsing experience designed to let you focus on the various contents shared in our platform, wherever and whenever you are. This experience is entirely free both from ads and payments!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AutoSizeText(
                "Questions? Feedback? To get help, ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
                child: new Text('visit  mindsparkintl.co',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                onTap: () => launch('https://mindsparkintl.co/')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
          ],
        ),
        //   ),
      ),
    );
  }
}
