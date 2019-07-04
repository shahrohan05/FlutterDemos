import 'package:fire_chat/screens/chat_screen.dart';
import 'package:fire_chat/screens/login_screen.dart';
import 'package:fire_chat/screens/registration_screen.dart';
import 'package:fire_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Chat',
      theme: ThemeData.dark().copyWith(
          accentColor: kMainAccent,
          appBarTheme: AppBarTheme(
            color: kMainAccent,
          )),
      initialRoute: WelcomeScreen.route,
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        ChatScreen.route: (context) => ChatScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        LoginScreen.route: (context) => LoginScreen(),
      },
    );
  }
}
