import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  AddContact({Key key}) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _surename;
  String _tel;
  String _adress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("New Contact"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  onSaved: (value) => _name = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Name")),
              TextFormField(
                  onSaved: (value) => _surename = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Surename")),
              TextFormField(
                  onSaved: (value) => _tel = value,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Telephone Number")),
              TextFormField(
                  onSaved: (value) => _adress = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Address")),
              RaisedButton(
                  child: Text("Add Contact"),
                  onPressed: () {
                    final form = _formKey.currentState;
                    form.save();
                    // Validate will return true if is valid, or false if invalid.
                    if (form.validate()) {
                      print("$_name $_surename $_tel $_adress");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
