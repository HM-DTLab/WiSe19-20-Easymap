import 'package:flutter/material.dart';
import 'package:swe11/emergency_page.dart';
import 'package:swe11/routes_page.dart';
import 'add_contact.dart';
import 'home.dart';
import 'login_site.dart';
import 'add_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addcontact': (context) => AddContact(),
        '/addroute': (context) => AddRoute(),
        '/emergency': (context) => EmergencyPage(),
        '/routepage': (context) => RoutesPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
