import 'package:flutter/material.dart';

import 'custom_card.dart';

class TwoChildrenCard extends StatelessWidget {
  TwoChildrenCard({
    @required this.color,
    this.topChild,
    this.bottomChild,
  });

  final Color color;
  final Widget topChild;
  final Widget bottomChild;

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
    );
  }
}
