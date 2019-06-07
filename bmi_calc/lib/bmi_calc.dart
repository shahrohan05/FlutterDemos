import 'dart:math';

class Person {
  Person({
    this.gender,
    this.height,
    this.weight,
    this.age,
  });

  String gender;
  int height;
  int weight;
  int age;

  double get heightInMeters {
    return (height / 39.37);
  }
}

class BMICalculator {
  BMICalculator({this.person}) {
    _bmi = person.weight / pow(person.heightInMeters, 2);
    if (_bmi < 16) {
      _bmiResult = 'Severe Thinness';
    } else if (_bmi >= 16 && _bmi < 17) {
      _bmiResult = 'Moderate Thinness';
    } else if (_bmi >= 17 && _bmi < 18.5) {
      _bmiResult = 'Underweight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      _bmiResult = 'Normal';
    } else if (_bmi >= 25 && _bmi < 30) {
      _bmiResult = 'Overweight';
    } else if (_bmi >= 30 && _bmi < 35) {
      _bmiResult = 'Obese Class I';
    } else if (_bmi >= 35 && _bmi < 40) {
      _bmiResult = 'Obese Class II';
    } else if (_bmi > 40) {
      _bmiResult = 'Obese Class III';
    }
  }
  Person person;

  double _bmi;

  String _bmiResult;

  Map<String, String> _bmiRange = {
    'Severe Thinness': '< 16 kg/m2',
    'Moderate Thinness': '16 - 17 kg/m2',
    'Underweight': '17 - 18.5 kg/m2',
    'Normal': '18.5 - 25 kg/m2',
    'Overweight': '25 - 30 kg/m2',
    'Obese Class I': '30 - 35 kg/m2',
    'Obese Class II': '35 - 34 kg/m2',
    'Obese Class III': '> 40 kg/m2',
  };

  Map<String, String> _bmiAdvise = {
    'Severe Thinness':
        'Hope you dont disappear soon! Eat anything you can find, just eat eat eat!',
    'Moderate Thinness':
        'Take care of your health, you need to start taking care of your diet and put on some weight.',
    'Underweight': 'You should follow better diet and put on some weight.',
    'Normal': 'Good job! You have a normal body weight.',
    'Overweight':
        'You should probably cut down on junk food and start exercising more.',
    'Obese Class I':
        'You should probably cut down on junk food and start exercising more.',
    'Obese Class II':
        'You should probably cut down on junk food and start exercising more.',
    'Obese Class III':
        'Nothing can be said now! You do what you want, enjoy it while it lasts!?? I guess!?',
  };

  /*Severe Thinness	< 16
  Moderate Thinness	16 - 17
  Mild Thinness	17 - 18.5
  Normal	18.5 - 25
  Overweight	25 - 30
  Obese Class I	30 - 35
  Obese Class II	35 - 40
  Obese Class III	> 40*/

  String get BMIString {
    return _bmi.toStringAsFixed(1);
  }

  String get BMIResultString {
    return _bmiResult;
  }

  String getBMIRange() {
    return _bmiRange[_bmiResult];
  }

  String getBMIAdvise() {
    return _bmiAdvise[_bmiResult];
  }
}
