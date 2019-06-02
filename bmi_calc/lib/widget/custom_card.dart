import 'package:flutter/material.dart';

const standardMargin = EdgeInsets.all(15.0);

final regularRadius = BorderRadius.circular(7.0);

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: standardMargin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: regularRadius,
      ),
      child: child,
    );
  }
}
