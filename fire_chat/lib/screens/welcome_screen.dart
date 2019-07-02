import 'package:animated_text_kit/animated_text_kit.dart';
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

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = ColorTween(begin: Colors.black, end: Color(0xFF303030))
        .animate(_controller);

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
      print("animation controller value : ${_animation.value}");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250.0,
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: 250.0,
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image.asset('images/fire_icon.png'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 25.0),
                width: 215.0,
                child: TypewriterAnimatedTextKit(
                  text: ['Fire Chat'],
                  textAlign: TextAlign.left,
                  textStyle: TextStyle(
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
                text: 'Register',
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
