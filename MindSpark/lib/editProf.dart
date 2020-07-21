import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _currentName;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),),
        body: SafeArea(
            child: Container(
                child:
                 Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      // Text(
                      //   "Update Information.",
                      //   style: TextStyle(fontSize: 18.0),
                      // ),
                      SizedBox(height: 20.0),
                      TextFormField(
                       decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                          hintText: 'What do people call you?',
                          labelText: 'Name ',
                        ),
                        validator: (val) =>
                            val.isEmpty ? ' Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //   initialValue: userData.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person, color: Colors.red),
                          hintText: 'About Yourself',
                          labelText: 'Bio ',
                        ),
                        validator: (val) =>
                            val.isEmpty ? ' Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //   initialValue: userData.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.link, color: Colors.red),
                          hintText: 'Link',
                          labelText: 'Link ',
                        ),
                        validator: (val) =>
                            val.isEmpty ? ' Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //   initialValue: userData.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.location_on, color: Colors.red),
                          hintText: 'Country',
                          labelText: 'Country ',
                        ),
                        validator: (val) =>
                            val.isEmpty ? ' Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        //   initialValue: userData.name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.cake, color: Colors.red),
                          hintText: 'Birthday',
                          labelText: 'date ',
                        ),
                        validator: (val) =>
                            val.isEmpty ? ' Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(onPressed: null, child: Text("Submit")),
                    ])
                    )
                    ))));
  }
}
