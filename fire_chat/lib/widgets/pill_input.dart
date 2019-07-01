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

    if (hint == 'Password') {
      obscureText = true;
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
        onChanged: this.onChanged,
        textAlign: TextAlign.center,
        obscureText: obscureText,
      ),
    );
  }
}
