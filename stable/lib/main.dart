import 'package:flutter/material.dart';
import 'package:stable/add_contact.dart';
import 'auth_service.dart';
import 'home.dart';
import 'login_site.dart';

void main() => runApp(
      ChangeNotifierProvider<AuthService>(
        child: MyApp(),
        builder: (BuildContext context) {
          return AuthService();
        },
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FutureBuilder(
              // get the Provider, and call the getUser method
              future: Provider.of<AuthService>(context).getUser(),
              // wait for the future to resolve and render the appropriate
              // widget for HomePage or LoginPage
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.hasData ? Home() : LoginPage();
                } else {
                  return Container(color: Colors.white);
                }
              },
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/addcontact': (context) => AddContact(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
