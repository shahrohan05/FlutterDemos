import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'story_driver.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destiny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showOutcome(String choice, BuildContext context) {
    Alert(
        context: context,
        content: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text(
                  getOutcome(choice),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Reset Game'),
                onPressed: () {
                  Navigator.pop(context);
                  resetStoryDriver();
                },
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 60.0,
                    ),
                    child: Card(
                      color: const Color.fromARGB(200, 255, 255, 255),
                      elevation: 16.0,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            currentStory,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[800],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 12.0,
                    ),
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text(
                        firstChoice,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.red[700],
                      onPressed: () {
                        setState(() {
                          if (!makeAChoice(firstChoice)) {
                            showOutcome(firstChoice, context);
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 12.0,
                    ),
                    child: RaisedButton(
                      elevation: 10.0,
                      child: Text(
                        secondChoice,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.indigo[800],
                      onPressed: () {
                        setState(() {
                          if (!makeAChoice(secondChoice)) {
                            showOutcome(secondChoice, context);
                          }
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
