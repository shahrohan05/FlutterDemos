import 'package:fire_chat/widgets/pill_button.dart';
import 'package:fire_chat/widgets/pill_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 200.0,
                  padding: EdgeInsets.only(right: 5.0),
                  child: Image.asset('images/fire_icon.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: PillInput(
                  onChanged: (value) {
                    email = value;
                  },
                  hint: 'Email Address',
                  width: 300.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: PillInput(
                  onChanged: (value) {
                    password = value;
                  },
                  hint: 'Password',
                  width: 300.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: PillButton(
                  onPressed: () async {
                    try {
                      final FirebaseUser user =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (user != null) {
                        print(user);
                        //Navigator.pushNamed(context, ChatScreen.route);
                      }
                    } catch (e) {
                      print("Error registering user!");
                      print(e);
                    }
                  },
                  text: 'Register',
                  minWidth: 300.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
