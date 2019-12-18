import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Login"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          alignment: Alignment.center,
          child: RaisedButton(
            child: Text("Here comes the Login page..."),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
