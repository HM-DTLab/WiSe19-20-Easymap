import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Add Route"),
            ),
            ListTile(
              title: Text("Add Contact"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addcontact');
              },
            ),
            ListTile(
              title: Text("Login"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
