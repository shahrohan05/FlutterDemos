import 'package:flutter/material.dart';

class PillInput extends StatelessWidget {
  PillInput({
    this.hint = '',
    @required this.onChanged,
    this.width = 200.0,
  });
  final String hint;
  final Function onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    bool obscureText = false;
    TextInputType textInputType = TextInputType.text;

    if (hint == 'Password') {
      obscureText = true;
    }

    if (hint.toLowerCase().contains('email') ||
        hint.toLowerCase().contains('e-mail')) {
      textInputType = TextInputType.emailAddress;
    }
    return Container(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          hintText: this.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          contentPadding: EdgeInsets.all(10.0),
        ),
        keyboardType: textInputType,
        onChanged: this.onChanged,
        textAlign: TextAlign.center,
        obscureText: obscureText,
      ),
    );
  }
}
