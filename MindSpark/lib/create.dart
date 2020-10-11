import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/cupertino.dart';

//void main() => runApp(new CreatePost());

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List<Asset> images = List<Asset>();
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),

            // backgroundColor: Hexcolor("#0d1822"),
            backgroundColor: Hexcolor("#E5E5E5"),
            title: Text(
              "Choose Media",
              style: TextStyle(color: Colors.black),
            ),
            content: GestureDetector(
              child: Text(
                "Image from gallery and camera",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                loadPicture(context);
              },
            ),
          );
        });
  }

  Future<void> loadPicture(BuildContext context) async {
    List<Asset> resultList;
    resultList = await MultiImagePicker.pickImages(
      maxImages: 3,
      enableCamera: true,
    );

    if (!mounted) return;
    setState(() {
      images = resultList;
    });
    Navigator.of(context).pop();
  }

  Widget _displaySelectedIamge() {
    return PageView(
        scrollDirection: Axis.horizontal,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AssetThumb(
              asset: asset,
              width: 380,
              height: 380,
            ),
          );
        }));
  }

  List<String> subjectList = [
    "Biology",
    "Math",
    " Physics",
    "Robotics",
    "Chemistry",
    "Astronomy",
    "Life Science",
    "Data Science",
    "Programming",
    "Aerospace engineering",
    "Industrial Engineering",
    "Electrical Engineering",
    "Mechanical Engineering",
    "Civil Engineering",
    "Artificial Intelligence",
  ];

  List<String> selectedReportList = List();

  _showSubjectDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            backgroundColor: Hexcolor('#E5E5E5'),
            title:
                Text("Choose Subjects", style: TextStyle(color: Colors.black)),
            content: SingleChildScrollView(
                child: ChooseSubjectChip(
              subjectList,
              onSelection: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            )),
            actions: <Widget>[
              RaisedButton(
                color: Hexcolor("#1f405e"),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // side: BorderSide(//  color: Hexcolor("#60aaa1"),)
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Hexcolor('#E5E5E5'),
        appBar: AppBar(
          backgroundColor: Hexcolor("#19222c"),
          title: Text("Create Posts"),
        ),
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 10,
                      bottom: 10,
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Title",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: titleController,
                        onChanged: ((String title) {
                          setState(() {
                            //  _title = title;
                            //  print(_title);
                          });
                        }),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Write Post",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 5,
                        controller: bodyController,
                        onChanged: ((String body) {
                          setState(() {});
                        }),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Detailed post',
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Hexcolor("#60aaa1"),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Hexcolor("#1f405e"),
                      child: Text(
                        "Choose subjects",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        //side: BorderSide(// color: Hexcolor("#60aaa1"),)
                      ),
                      onPressed: () {
                        _showSubjectDialog();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedReportList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Hexcolor("#FBD772"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              //side: BorderSide(//color: Hexcolor("#1f405e"),)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "${selectedReportList[index]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Hexcolor("#1f405e"),
                      child: Text(
                        "Choose media",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        //side: BorderSide(//  color: Hexcolor("#60aaa1"),)
                      ),
                      onPressed: () {
                        _showSelectionDialog(context);
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      height: 350,
                      width: 380,
                      child: GestureDetector(
                        child: _displaySelectedIamge(),
                        onTap: () {
                          _showSelectionDialog(context);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )));
  }
}

class ChooseSubjectChip extends StatefulWidget {
  final List<String> subjectList;
  final Function(List<String>) onSelection;

  ChooseSubjectChip(this.subjectList, {this.onSelection});

  @override
  _ChooseSubjectChipState createState() => _ChooseSubjectChipState();
}

class _ChooseSubjectChipState extends State<ChooseSubjectChip> {
  // String selectedChoice = "";
  List<String> choiceSelected = List();

  _choiceList() {
    List<Widget> choose = List();

    widget.subjectList.forEach((item) {
      choose.add(Container(
        // color: Hexcolor("#0d1822"),
        padding: const EdgeInsets.all(5.0),

        child: ChoiceChip(
          backgroundColor: Hexcolor('#60aaa1'),
          //   Hexcolor("#1f405e"),
          selectedColor: Hexcolor("#FBD772"),
          label: Text(
            item,
            style: TextStyle(color: Colors.black),
          ),
          selected: choiceSelected.contains(item),
          onSelected: (selected) {
            setState(() {
              choiceSelected.contains(item)
                  ? choiceSelected.remove(item)
                  : choiceSelected.add(item);
              widget.onSelection(choiceSelected);
            });
          },
          // )
        ),
      ));
    });

    return choose;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _choiceList(),
    );
  }
}