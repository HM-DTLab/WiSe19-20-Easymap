import 'package:flutter/material.dart';
import 'package:stable/add_contact.dart';
import 'home.dart';
import 'login_site.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/addcontact': (context) => AddContact(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
