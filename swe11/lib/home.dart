import 'package:flutter/material.dart';

import 'custom_drawer.dart';
import 'floating_buttons.dart';
import 'maps.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.green[700],
      ),
      drawer: CustomDrawer(),
      body: Maps(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtons(),
    );
  }
}
