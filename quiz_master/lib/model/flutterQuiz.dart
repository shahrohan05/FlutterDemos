import 'question.dart';

int _questionNo = 0;

List<Question> _questions = [
  Question(
    questionText: 'Expanded widget can have a property called "flex"',
    answer: true,
  ),
  Question(
    questionText: 'List is a build-in type in Dart.',
    answer: true,
  ),
  Question(
    questionText: 'Column widget has a "child" property.',
    answer: false,
  ),
  Question(
    questionText:
        'You can fit multple widgets as children to the Container Widget.',
    answer: false,
  ),
  Question(
    questionText:
        'Stack widget can be used to lay out widgets on top of each other.',
    answer: true,
  ),
  Question(
    questionText: 'Icons is an external flutter package.',
    answer: false,
  )
];

void nextQuestion() {
  if (_questionNo < _questions.length - 1) {
    _questionNo++;
  } else {
    _questionNo = 0;
  }
}

int getQuestionNumber() {
  return _questionNo;
}

bool isQuizOver() {
  return _questionNo == (_questions.length - 1);
}

String getQuestionText() {
  return _questions[_questionNo].questionText;
}

bool getAnswer() {
  return _questions[_questionNo].answer;
}
