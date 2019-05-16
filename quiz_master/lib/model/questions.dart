class Question {
  String questionText;
  bool result;

  Question({String questionText, bool result}) {
    this.questionText = questionText;
    this.result = result;
  }
}

List<Question> questions = [
  Question(
    questionText: 'Expanded widget can have a property called "flex"',
    result: true,
  ),
  Question(
    questionText: 'List is a build-in type in Dart.',
    result: true,
  ),
  Question(
    questionText: 'Column widget has a "child" property.',
    result: false,
  ),
  Question(
    questionText:
        'You can fit multple widgets as children to the Container Widget.',
    result: false,
  ),
  Question(
    questionText:
        'Stack widget can be used to lay out widgets on top of each other.',
    result: true,
  ),
  Question(
    questionText: 'Icons is an external flutter package.',
    result: false,
  )
];
