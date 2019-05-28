import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'model/flutterQuiz.dart';

void main() => runApp(QuizMasterApp());

class QuizMasterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Master',
      home: QuizMaster(),
    );
  }
}

class QuizMaster extends StatefulWidget {
  @override
  _QuizMasterState createState() => _QuizMasterState();
}

class _QuizMasterState extends State<QuizMaster> {
  List<Icon> results = [];

  void updateQuestion(bool ans, bool actualAns, BuildContext context) {
    setState(() {
      if (ans == actualAns) {
        results.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        results.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (isQuizOver()) {
        Alert(
            context: context,
            title: "Congratulations!",
            desc: "Your flutter quiz is over.",
            buttons: [
              DialogButton(
                child: Text(
                  'Cool',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context),
                color: Colors.grey[800],
              )
            ]).show();
        results = [];
      }
      nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  getQuestionText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: RaisedButton(
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    updateQuestion(true, getAnswer(), context);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: RaisedButton(
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    updateQuestion(false, getAnswer(), context);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: results,
              ),
            )
          ],
        ),
      ),
    );
  }
}
