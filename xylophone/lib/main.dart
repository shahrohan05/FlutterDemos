import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NoteKey(
                    note: 1,
                    horizontalMargin: 10.0,
                  ),
                  NoteKey(
                    note: 2,
                    horizontalMargin: 14.0,
                  ),
                  NoteKey(
                    note: 3,
                    horizontalMargin: 18.0,
                  ),
                  NoteKey(
                    note: 4,
                    horizontalMargin: 22.0,
                  ),
                  NoteKey(
                    note: 5,
                    horizontalMargin: 26.0,
                  ),
                  NoteKey(
                    note: 6,
                    horizontalMargin: 30.0,
                  ),
                  NoteKey(
                    note: 7,
                    horizontalMargin: 34.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoteKey extends StatefulWidget {
  NoteKey({@required this.note, this.horizontalMargin});

  final int note;
  final double horizontalMargin;

  @override
  _NoteKeyState createState() => _NoteKeyState();
}

class _NoteKeyState extends State<NoteKey> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.0,
        margin: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: _getNoteColor(widget.note),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
      onTap: () {
        final audioCache = AudioCache();
        int _note = widget.note;
        print('note$_note.wav');
        audioCache.play('note$_note.wav');
      },
    );
  }
}

Color _getNoteColor(int note) {
  switch (note) {
    case 1:
      return Colors.red;
    case 2:
      return Colors.cyan;
    case 3:
      return Colors.blue[600];
    case 4:
      return Colors.indigo[900];
    case 5:
      return Colors.purple[800];
    case 6:
      return Colors.yellow[500];
    case 7:
      return Colors.orange;
  }
  return Colors.black;
}
