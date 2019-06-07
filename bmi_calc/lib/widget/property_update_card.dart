import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styles.dart';
import 'custom_card.dart';
import 'round_icon_button.dart';

class PropertyUpdateCard extends StatelessWidget {
  PropertyUpdateCard({
    @required this.property,
    @required this.propertyName,
    this.onIncrease,
    this.onDecrease,
  });

  final int property;
  final String propertyName;
  final Function onIncrease;
  final Function onDecrease;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        color: kActiveCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              propertyName,
              style: kDisabledTextStyle,
            ),
            Text(
              property.toString(),
              style: kLargeFont,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                    icon: FontAwesomeIcons.minus, onPressed: onDecrease),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                    icon: FontAwesomeIcons.plus, onPressed: onIncrease)
              ],
            )
          ],
        ));
  }
}
