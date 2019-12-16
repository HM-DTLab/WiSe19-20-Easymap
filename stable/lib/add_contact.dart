import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  AddContact({Key key}) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Add Contact Page"),
        backgroundColor: Colors.green,
      ),
      body: RaisedButton(
        child: Text("+"),
        onPressed: () {},
      ),
    );
  }
}
