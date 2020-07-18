import 'package:flutter/material.dart';
import 'SizeConfig.dart';
import 'test.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              color: Colors.blue[600],
              height: 40 * SizeConfig.heightMultiplier,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 11 * SizeConfig.heightMultiplier,
                        width: 22 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sketchappsources.com%2Ffree-source%2F3781-profile-illustration-user-sketch-freebie-resource.html&psig=AOvVaw3Ln1P_SyOuzDqeM6s3o9RY&ust=1594952453453000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLi7qYfb0OoCFQAAAAAdAAAAABAD")
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}