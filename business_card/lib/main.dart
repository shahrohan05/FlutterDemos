import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.red,
                  backgroundImage:
                      AssetImage('images/IMG_20190116_143952_422.jpg'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Rohan Shah',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: 'Satisfy',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'SOFTWARE DEVELOPER',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                      fontFamily: 'NovaMono',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(5.0, 4.0, 20.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.blueGrey[800],
                      ),
                      Container(
                        width: 180.0,
                        alignment: Alignment.center,
                        child: Text('+91 123 456 7890'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(5.0, 4.0, 20.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        color: Colors.blueGrey[800],
                      ),
                      Container(
                        width: 180.0,
                        alignment: Alignment.center,
                        child: Text('rohan.shah@email.com'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
