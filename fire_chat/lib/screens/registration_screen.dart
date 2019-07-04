import 'package:fire_chat/constants.dart';
import 'package:fire_chat/screens/chat_screen.dart';
import 'package:fire_chat/widgets/pill_button.dart';
import 'package:fire_chat/widgets/pill_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showLoader,
        color: kMainAccent,
        child: Container(
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              return SafeArea(
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
                          try {
                            if (email == "" || password == "") {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Please provide email address and password"),
                                ),
                              );
                              return;
                            }
                            setState(() {
                              showLoader = true;
                            });
                            final FirebaseUser user =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            setState(() {
                              showLoader = false;
                            });
                            if (user != null) {
                              print(user);
                              Navigator.pushNamed(context, ChatScreen.route);
                            } else {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Cannot log you in! Make sure email and password are correct.'),
                                ),
                              );
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
              );
            },
          ),
        ),
      ),
    );
  }
}
