import 'package:flutter/material.dart';

class FloatingButtons extends StatefulWidget {
  FloatingButtons({Key key}) : super(key: key);

  @override
  _FloatingButtonsState createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: RaisedButton(
                  child: Text("Routen"),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/routepage');
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: RaisedButton(
                  child: Text("NOTFALL"),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, '/emergency');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
