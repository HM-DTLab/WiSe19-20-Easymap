import 'package:flutter/material.dart';

class RoutesPage extends StatefulWidget {
  RoutesPage({Key key}) : super(key: key);

  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Routes"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Example Route 1"),
            ),
            ListTile(
              title: Text("Example Route 2"),
            ),
            ListTile(
              title: Text("Example Route 3"),
            ),
            ListTile(
              title: Text("Example Route 4"),
            )
          ],
        ),
      ),
    );
  }
}
