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
        child: returnListTiles(context),
      ),
    );
  }
}

returnListTiles(BuildContext context) {
  List<Widget> listArray = [];
  int i;
  for (i = 0; i <= 10; i++) {
    listArray.add(new ListTile(title: Text(i.toString()),onTap: () => Navigator.pop(context),));
  }
  return ListView(
    children: <Widget>[
      for (int j= 0; j < i; j++) 
      listArray.elementAt(j)
    ],
  );
}
