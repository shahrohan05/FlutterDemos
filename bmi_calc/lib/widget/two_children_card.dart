import 'package:flutter/material.dart';

import 'custom_card.dart';

class TwoChildrenCard extends StatelessWidget {
  TwoChildrenCard({
    @required this.color,
    this.topChild,
    this.bottomChild,
    this.onTap,
  });

  final Color color;
  final Widget topChild;
  final Widget bottomChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          topChild,
          bottomChild,
        ],
      ),
      onTap: onTap,
    );
  }
}
