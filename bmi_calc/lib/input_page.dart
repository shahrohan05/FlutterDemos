import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widget/custom_card.dart';
import 'widget/icon_content_card.dart';

const activeCardColor = Color(0xFF1D1F33);
const inactiveCardColor = Color(0xFF101223);
const accentColor = Color(0xFFEA1556);
const customBarHeight = 80.0;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: IconContentCard(
                          color: selectedGender == Gender.male
                              ? activeCardColor
                              : inactiveCardColor,
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: IconContentCard(
                          color: selectedGender == Gender.female
                              ? activeCardColor
                              : inactiveCardColor,
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: activeCardColor,
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomCard(
                        color: activeCardColor,
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        color: activeCardColor,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
                color: accentColor,
                height: customBarHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
