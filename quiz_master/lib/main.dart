import 'package:flutter/material.dart';

import 'model/questions.dart';

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
  int queNo = 1;
  Question question;
  void updateQuestion(bool ans) {
    setState(() {
      bool actualAns = question.result;
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
      if (queNo == 5) {
        queNo = 0;
      } else {
        queNo++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    question = questions[queNo];
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
                  question.questionText,
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
                    updateQuestion(true);
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
                    updateQuestion(false);
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
