import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

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
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Login Information',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                    onSaved: (value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address")),
                TextFormField(
                    onSaved: (value) => _password = value,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password")),
                SizedBox(height: 20.0),
                RaisedButton(
                    child: Text("LOGIN"),
                    onPressed: () {
                      final form = _formKey.currentState;
                      form.save();
                      // Validate will return true if is valid, or false if invalid.
                      if (form.validate()) {

                       
                        // _makeGetRequest();
                        _makePostRequest('{"email":"$_email", "password":"$_password"}');
                        
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _makeGetRequest() async {
    var response =  await http.get('http://10.0.2.2:5000/about');
    print(response.body);
                        
  }

  _makePostRequest(jsons) async {
    
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post('http://10.0.2.2:5000/login', headers: headers, body: jsons);
    String b =response.body;
    globals.token = json.decode(b)['token'];
    globals.token = json.decode(b)['username'];
    print(b);
    
  }
}
