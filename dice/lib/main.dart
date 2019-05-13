import 'dart:math';

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
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'DICE',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'Satisfy',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Dice(),
                    ),
                    Expanded(
                      child: Dice(),
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

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Image.asset('images/dice$diceNumber.png'),
      onPressed: () {
        setState(() {
          diceNumber = Random().nextInt(6) + 1;
          print(" Random Dice Number : $diceNumber");
        });
      },
    );
  }
}
