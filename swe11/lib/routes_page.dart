import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;


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

    _makePostRequest(jsons) async {
    
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post('http://10.0.2.2:5000/routes', headers: headers, body: jsons);
    List<Widget> listArray = [];
    if (response.statusCode == 200){
    var j = (json.decode(response.body)["routes"]);
    j.forEach((element)=>listArray.add(new ListTile(
              title: Text("Route " + element["id"].toString()))));
    }
    return listArray;
  }

  returnListTiles(BuildContext context) {

  _makePostRequest('{"username":"admin", "token":"1234"}').then((value){

  });
        return ListView(
    children: <Widget>[
      ListTile(title: Text("Route 1", textAlign: TextAlign.center, style: TextStyle(fontSize: 35))),
      ListTile(title: Text("Route 2",textAlign: TextAlign.center, style: TextStyle(fontSize: 35)))
    ],
  );
 
  

}
}



class Routes {
  int id;
  double lat;
  double lon;

  

  Routes(int id, double lat, double lon){
    this.id = id;
    this.lat = lat;
    this.lon = lon;
  }



}


