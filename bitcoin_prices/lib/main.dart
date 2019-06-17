import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Prices',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Bitcoin Prices'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Test Bitcoin Prices',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30.0,
        color: Colors.blueGrey[700],
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Row(
            children: <Widget>[
              Text('Bottom App Bar'),
            ],
          ),
        ),
      ),
    );
  }
}
