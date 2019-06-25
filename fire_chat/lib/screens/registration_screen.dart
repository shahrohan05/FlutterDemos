import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Container(
        child: Center(
          child: Text('Registration Screen'),
        ),
      ),
    );
  }
}
