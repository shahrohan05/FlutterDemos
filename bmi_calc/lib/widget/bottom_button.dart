import 'package:bmi_calc/styles.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.text, this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: titleFontStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 8.0),
        color: kAccentColor,
        height: kCustomBarHeight,
      ),
    );
  }
}
