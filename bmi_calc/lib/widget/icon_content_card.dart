import 'package:flutter/material.dart';

import 'two_children_card.dart';

const iconFontSize = 80.0;
final disabledTextStyle = TextStyle(
  color: Colors.grey[400],
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
);
const spaceBetween = 30.0;

class IconContentCard extends StatelessWidget {
  IconContentCard({this.color, this.icon, this.label});

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TwoChildrenCard(
      color: color,
      topChild: Icon(
        icon,
        size: iconFontSize,
      ),
      bottomChild: Container(
        margin: EdgeInsets.only(
          top: spaceBetween,
        ),
        child: Text(label, style: disabledTextStyle),
      ),
    );
  }
}
