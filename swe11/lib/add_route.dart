import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRoute extends StatefulWidget {
  AddRoute({Key key}) : super(key: key);

  @override
  _AddRouteState createState() => _AddRouteState();
}

class _AddRouteState extends State<AddRoute> {
  final _formKey = GlobalKey<FormState>();
  String _routeName;
  String _startAdress;
  String _endAdress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("New Route"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  onSaved: (value) => _routeName = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Name of the Route")),
              TextFormField(
                  onSaved: (value) => _startAdress = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Start Adress")),
              SizedBox(height: 20.0),
              TextFormField(
                  onSaved: (value) => _endAdress = value,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "End Adress")),
              SizedBox(height: 20.0),
              RaisedButton(
                  child: Text("Add Contact"),
                  onPressed: () {
                    final form = _formKey.currentState;
                    form.save();
                    // Validate will return true if is valid, or false if invalid.
                    if (form.validate()) {
                      print("$_routeName $_startAdress $_endAdress");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
