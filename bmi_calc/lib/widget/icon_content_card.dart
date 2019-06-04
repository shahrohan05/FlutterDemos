import 'package:flutter/material.dart';

import '../styles.dart';
import 'two_children_card.dart';

class IconContentCard extends StatelessWidget {
  IconContentCard({
    this.color,
    this.icon,
    this.label,
    this.onTap,
  });

  final Color color;
  final IconData icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return TwoChildrenCard(
      color: color,
      topChild: Icon(
        icon,
        size: kIconFontSize,
      ),
      bottomChild: Container(
        margin: EdgeInsets.only(
          top: kSpaceBetween,
        ),
        child: Text(label, style: kDisabledTextStyle),
      ),
      onTap: onTap,
    );
  }
}
