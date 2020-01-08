import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  EmergencyPage({Key key}) : super(key: key);

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Routes"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          height: 70,
          width: 350,
          child: RaisedButton(
            child: Text("Press in case of Emergency",
                style: TextStyle(color: Colors.white, fontSize: 25)),
            color: Colors.redAccent,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
