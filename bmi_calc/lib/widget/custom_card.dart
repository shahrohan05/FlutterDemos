import 'package:flutter/material.dart';

import '../styles.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child, this.onTap});

  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: kStandardMargin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: regularRadius,
        ),
        child: child,
      ),
    );
  }
}
