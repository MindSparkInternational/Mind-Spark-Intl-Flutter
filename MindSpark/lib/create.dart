import 'package:MindSpark/dataClasses/post.dart';
import 'package:MindSpark/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/postModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CreatePost());
  }
}

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  String _title;
  String _type;
  // String _fields;
  String _subhead;
  String _body;
  File _image;
  Post finalPost;
  List<String> selectedReportList = List();

  var title = TextEditingController();
  var type = TextEditingController();
  var fields = TextEditingController();
  var subhead = TextEditingController();
  var body = TextEditingController();
  bool titleValidate = false;
  bool bodyValidate = false;
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
  List<File> files = List<File>();
  // void getFileList() async {
  //   files.clear();
  //   for (int i = 0; i < images.length; i++) {
  //     var path =
  //         await FlutterAbsolutePath.getAbsolutePath(images[i].identifier);
  //     //var path = await images[i].filePath;
  //     print(path);
  //     var file = await getImageFileFromAsset(path);
  //     print(file);
  //     files.add(file);
  //   }
  // }

  // Future<File> getImageFileFromAsset(String path) async {
  //   final file = File(path);
  //   return file;
  // }

  List<Asset> images = List<Asset>();
  Future<void> loadPicture(BuildContext context) async {
    List<Asset> resultList;
    resultList = await MultiImagePicker.pickImages(
      maxImages: 3,
      enableCamera: true,
      selectedAssets: images,
    );

    if (!mounted) return;
    setState(() {
      images = resultList;
      //getFileList();
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

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),

            // backgroundColor: Hexcolor("#0d1822"),
            backgroundColor: Color(0xffE5E5E5),
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
                // getGalleryImage();
              },
            ),
          );
        });
  }

//------------------------Image display

  // Widget _setImageView() {
  //   if (_image != null) {
  //     return ClipRRect(
  //         borderRadius: BorderRadius.circular(50),
  //         child: Image.file(
  //           _image,
  //           width: 400,
  //           height: 400,
  //           fit: BoxFit.fill,
  //         ));
  //   } else {
  //     return Text("");
  //   }
  // }

  _showSubjectDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            backgroundColor: Color(0xffE5E5E5),
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
                color: Color(0xff1f405e),
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
// CircularProgressIndicator
    // pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    // pr.style(
    //   message: 'Please wait...',
    //   borderRadius: 10.0,
    //   backgroundColor: Colors.white,
    //   progressWidget: CircularProgressIndicator(),
    //   elevation: 10.0,
    //   insetAnimCurve: Curves.easeInOut,
    //   progressTextStyle: TextStyle(
    //       color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //   messageTextStyle: TextStyle(
    //       color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    // );
    bool validateTitleField(String userInputTitle) {
      if (userInputTitle.isEmpty) {
        setState(() {
          titleValidate = true;
        });
        return false;
      }
      setState(() {
        titleValidate = false;
        bodyValidate = false;
      });
      return true;
    }

    bool validateBodyField(String userInputBody) {
      if (userInputBody.isEmpty) {
        setState(() {
          bodyValidate = true;
        });
        return false;
      }
      setState(() {
        bodyValidate = false;
      });
      return true;
    }

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xff19222c),
        title: Text("Create Posts"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 10,
              top: 10,
            ),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
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
                        controller: title,
                        onChanged: ((String title) {
                          setState(() {
                            _title = title;
                            print(_title);
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
                              color: Color(0xff60aaa1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff60aaa1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText:
                              titleValidate ? 'Please enter title' : null,
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
                        controller: body,
                        onChanged: ((String body) {
                          setState(() {
                            _body = body;
                            print(_body);
                          });
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
                              color: Color(0xff60aaa1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff60aaa1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: bodyValidate
                              ? 'Please write detailed post'
                              : null,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      color: Color(0xff1f405e),
                      child: Text(
                        "Choose subjects",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        //side: BorderSide(// color: Hexcolor("#60aaa1"),)
                      ),
                      onPressed: () {
                        _showSubjectDialog(context);
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
                            color: Color(0xffFBD772),
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
                      color: Color(0xff1f405e),
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
                        //  color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      height: 380,
                      width: 380,
                      child: GestureDetector(
                        child:
                            //_setImageView(),

                            _displaySelectedIamge(),
                        onTap: () {
                          // _showSelectionDialog(context);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),

                    Center(
                      child: Container(
                        width: 300,
                        //   margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,

                        child: RaisedButton(
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: Color(0xff1f405e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            //side: BorderSide(//  color: Hexcolor("#60aaa1"),)
                          ),
                          onPressed: () {
                            validateTitleField(title.text);
                            validateBodyField(title.text);
                            uploadPostimages(images);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                            //Navigator.push( context, MaterialPageRoute( builder: (context) => Home()), ).then((value) => setState(() {
                              //Provider.of<PostModel>(context, listen: true).addToBeginning(finalPost);
                            //}
                            
                            //));// _startUploading();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future uploadPostimages(List images) async {
    Uri uri = Uri.parse(
      'https://mindsparkapi.herokuapp.com/api/v1/posts/create/',
    );
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    print('$token');
    var headers = {'Authorization': ' $token'};

    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.fields['type'] = 'post';
    request.fields['body'] = _body;
    request.fields['title'] = _title;
    request.fields['subhead'] = 'null';
    request.fields['fields'] = selectedReportList.join(' ');
    

    if (images != null) {
      int image_index = 0;
      // Repeat for Number of Images Selected.
      for (Asset asset in images) {
        ByteData byteData = await asset.getByteData();
        List<int> imageData = byteData.buffer.asUint8List();

        var image_To_Send = "image" + '$image_index';
        // Prepare Multipart File.
        MultipartFile multipartFile = new MultipartFile.fromBytes(
          /* WARNING: Have different name  MultipartFile.fromBytes.string. */
          image_To_Send,
          imageData,
          filename: 'case',
         contentType: MediaType("image/png", "image/jpg"),
        );

        // Add Image at the end of Request.
        //request.files.insert(0, multipartFile);
        request.files.add(multipartFile);
        image_index++;
      }
      // Send Request to Server (With all images added).
      var response = await request.send();
      //print(response.body);
      // We are expecting response.statusCode = 0x200 for SUCESS but it is giving 0x201, Need to look into.
      if (response.statusCode == 201) {
        print("Image Uploaded");
        response.stream.transform(utf8.decoder).listen((value) {
          print("aa$value");
          var test = json.decode(value);
          finalPost = Post.fromJson(test as Map<String, dynamic>);
          Provider.of<PostModel>(context, listen: true).addToBeginning(finalPost);
          
        //   Fluttertoast.showToast(
        //       msg: "Post Created",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        });
      } else {
        print(
            "********Upload Failed Statuc Code - $response.statusCode********");
        // Fluttertoast.showToast(
        //     msg: "Post request not successful",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    }
  }
}

class ChooseSubjectChip extends StatefulWidget {
  final List<dynamic> subjectList;
  final Function(List<String>) onSelection;

  ChooseSubjectChip(this.subjectList, {this.onSelection});

  @override
  _ChooseSubjectChipState createState() => _ChooseSubjectChipState();
}

class _ChooseSubjectChipState extends State<ChooseSubjectChip> {
  List<String> choiceSelected = List();

  _choiceList() {
    List<Widget> choose = List();

    widget.subjectList.forEach((item) {
      choose.add(Container(
        // color: Hexcolor("#0d1822"),
        padding: const EdgeInsets.all(5.0),

        child: ChoiceChip(
          backgroundColor: Color(0xff60aaa1),
          //   Hexcolor("#1f405e"),
          selectedColor: Color(0xffFBD772),
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
