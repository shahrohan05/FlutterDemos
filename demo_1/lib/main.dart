import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo 1'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey[800],
        body: Center(
          child: Container(
            margin: EdgeInsets.all(0),
            child: Image(image: AssetImage('images/diamond.png')),
          ),
        ),
      ),
    ),
  );
}
