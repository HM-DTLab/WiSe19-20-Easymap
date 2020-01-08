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
              leading: Icon(Icons.pin_drop),
              title: Text("Add Route"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addroute');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Add Contact"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/addcontact');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Sign in"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text("Link Account"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text("Impressum"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
