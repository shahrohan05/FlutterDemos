import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          backgroundColor: Colors.brown[900],
        ),
        backgroundColor: Colors.brown[800],
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Image(image: AssetImage('images/aliens.png')),
          ),
        ),
      ),
    ),
  );
}
