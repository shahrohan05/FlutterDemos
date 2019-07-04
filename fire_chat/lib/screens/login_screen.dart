import 'package:fire_chat/constants.dart';
import 'package:fire_chat/screens/chat_screen.dart';
import 'package:fire_chat/widgets/pill_button.dart';
import 'package:fire_chat/widgets/pill_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool showLoader = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showLoader,
        color: kMainAccent,
        child: Container(
          alignment: Alignment.center,
          child: Builder(
            builder: (context) => SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Container(
                            width: 120.0,
                            padding: EdgeInsets.fromLTRB(0.0, 13.0, 5.0, 0.0),
                            child: Image.asset('images/fire_icon.png'),
                          ),
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
                            if (email == "" || password == "") {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please provide email address and password!'),
                                ),
                              );
                              return;
                            }
                            setState(() {
                              showLoader = true;
                            });
                            try {
                              FirebaseUser user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              setState(() {
                                showLoader = false;
                              });
                              if (user != null) {
                                Navigator.pushNamed(context, ChatScreen.route);
                              }
                            } catch (e) {
                              setState(() {
                                showLoader = false;
                              });
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Error logginig you in! please try again later.'),
                                ),
                              );
                              print(e);
                            }
                          },
                          text: 'Login',
                          minWidth: 300.0,
                        ),
                      )
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
