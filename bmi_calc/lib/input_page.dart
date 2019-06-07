import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bmi_calc.dart';
import 'results_page.dart';
import 'styles.dart';
import 'widget/bottom_button.dart';
import 'widget/custom_card.dart';
import 'widget/icon_content_card.dart';
import 'widget/property_update_card.dart';

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
  int height = 48;
  int weight = 35;
  int age = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        elevation: 15.0,
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
                      child: IconContentCard(
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: IconContentCard(
                        color: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomCard(
                  color: kActiveCardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kDisabledTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              (height / 12).floor().toString(),
                              style: kLargeFont,
                            ),
                            Text(
                              'ft',
                              style: kDisabledTextStyle,
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Text(
                              (height % 12).round().toString(),
                              style: kLargeFont,
                            ),
                            Text(
                              'in',
                              style: kDisabledTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey[700],
                              thumbColor: kAccentColor,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 13.0,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 25.0,
                              ),
                              overlayColor: Color(0x29EA1556)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 36.0,
                            max: 84.0,
                            onChanged: (newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: PropertyUpdateCard(
                        property: weight,
                        propertyName: 'WEIGHT',
                        onDecrease: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: PropertyUpdateCard(
                        property: age,
                        propertyName: 'AGE',
                        onDecrease: () {
                          setState(() {
                            age--;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              BottomButton(
                text: 'CALCULATE',
                onTap: () {
                  Person person = new Person(
                    gender: selectedGender.toString(),
                    age: age,
                    weight: weight,
                    height: height,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(person: person),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
