import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  PillButton({
    @required this.onPressed,
    @required this.text,
    this.color = kMainAccent,
    this.minWidth = 100.0,
  });

  final Function onPressed;
  final String text;
  final Color color;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      child: RaisedButton(
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: kLightTheme,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
