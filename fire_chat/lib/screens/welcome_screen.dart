import 'package:fire_chat/constants.dart';
import 'package:fire_chat/screens/login_screen.dart';
import 'package:fire_chat/screens/registration_screen.dart';
import 'package:fire_chat/widgets/pill_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250.0,
                padding: EdgeInsets.only(right: 5.0),
                child: Image.asset('images/fire_icon.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 25.0),
                child: Text(
                  'Fire Chat',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Righteous',
                      color: kLightTheme),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: PillButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.route);
                  },
                  text: 'Login',
                  minWidth: 300.0,
                ),
              ),
              PillButton(
                text: 'Registration',
                minWidth: 300.0,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
