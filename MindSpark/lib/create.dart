import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(new Create());

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.black38,
                Colors.black54,
              ],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
            ),
          ),
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 15,),
              new TyperAnimatedTextKit(
                text: ["", "Create"],
                textStyle: TextStyle(fontSize: 30.0),
                isRepeatingAnimation: false,
              ),
              new SizedBox(height: 10,),
              new Align(
                alignment: Alignment(-.9, -.7),
                child: new GestureDetector(
                  child: Icon(Icons.arrow_drop_down_circle),
                  onTap: () => Navigator.pop(context),
                ) 
              ),
              new SizedBox(height:150),
              TranslationAnimatedWidget.tween(
                enabled: enabled,
                translationDisabled: Offset(200, 0),
                translationEnabled: Offset(0, 0),
                child:
                  OpacityAnimatedWidget.tween(
                  enabled: enabled,
                  opacityDisabled: 0,
                  opacityEnabled: 1,
                  child: new NiceButton(
                    radius: 30,
                    padding: const EdgeInsets.all(15),
                    text: "Register",
                    icon: Icons.account_box,
                    gradientColors: [secondColor, firstColor],
                  ),
                ),
              ),
              new SizedBox(height: 50),
              TranslationAnimatedWidget.tween(
                enabled: enabled,
                translationDisabled: Offset(-200, 0),
                translationEnabled: Offset(0, 0),
                child:
                  OpacityAnimatedWidget.tween(
                  enabled: enabled,
                  opacityDisabled: 0,
                  opacityEnabled: 1,
                  child: new NiceButton(
                    radius: 30,
                    padding: const EdgeInsets.all(15),
                    text: "Register",
                    icon: Icons.account_box,
                    gradientColors: [Colors.pink, Colors.purple],
                  ),
                ),
              ),
              new SizedBox(height: 50),
              TranslationAnimatedWidget.tween(
                enabled: enabled,
                translationDisabled: Offset(200, 0),
                translationEnabled: Offset(0, 0),
                child:
                  OpacityAnimatedWidget.tween(
                  enabled: enabled,
                  opacityDisabled: 0,
                  opacityEnabled: 1,
                  child: new NiceButton(
                    radius: 30,
                    padding: const EdgeInsets.all(15),
                    text: "Register",
                    icon: Icons.account_box,
                    gradientColors: [Colors.amber, Colors.orange],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}