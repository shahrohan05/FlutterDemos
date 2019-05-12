import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Dice',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Image.asset('images/dice1.png'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Image.asset('images/dice2.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
