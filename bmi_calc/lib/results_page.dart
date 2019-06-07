import 'package:flutter/material.dart';

import 'bmi_calc.dart';
import 'styles.dart';
import 'widget/bottom_button.dart';
import 'widget/custom_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    BMICalculator bmiCalculator = BMICalculator(person: person);
    String bmiResult = bmiCalculator.BMIResultString;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(37.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 37.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomCard(
                      color: kActiveCardColor,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                              bmiCalculator.BMIResultString.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color:
                                    (bmiCalculator.BMIResultString == 'Normal'
                                        ? Color(0xFF52B489)
                                        : Colors.red),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              bmiCalculator.BMIString,
                              style: TextStyle(
                                fontSize: 120.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '$bmiResult BMI range:',
                                  style: kDisabledTextStyleReg,
                                ),
                                Text(
                                  bmiCalculator.getBMIRange(),
                                  style: kEnabledTextStyleReg,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 10.0,
                              ),
                              child: Text(
                                bmiCalculator.getBMIAdvise(),
                                style: kEnabledTextStyleReg,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BottomButton(
                  text: 'RE-CALCULATE YOUR BMI',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
