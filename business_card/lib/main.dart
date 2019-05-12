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
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  width: 180.0,
                  padding: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blueGrey,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Text(
                    'SOFTWARE DEVELOPER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blueGrey,
                      fontFamily: 'NovaMono',
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  color: Colors.blueGrey[800],
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      '+91 123 456 7890',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  color: Colors.blueGrey[800],
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    title: Text(
                      'rohan.shah@email.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
