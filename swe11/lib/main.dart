import 'package:flutter/material.dart';
import 'add_contact.dart';
import 'home.dart';
import 'login_site.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addcontact': (context) => AddContact(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}


