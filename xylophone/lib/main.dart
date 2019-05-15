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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0,
              0.4,
              1.0,
            ],
            colors: [
              Colors.white,
              Colors.blueGrey[100],
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  PipesWidget(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PipesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Center(
          child: Container(
            width: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                PipeVertical(),
                PipeVertical(),
              ],
            ),
          ),
        ),
      );
}

class PipeVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 20,
        decoration: BoxDecoration(
          color: Colors.brown[800],
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      );
}

class NoteKey extends StatefulWidget {
  NoteKey({@required this.note, this.horizontalMargin});

  final int note;
  final double horizontalMargin;

  @override
  _NoteKeyState createState() => _NoteKeyState();
}

class _NoteKeyState extends State<NoteKey> {
  Color defaultColor;
  Color saturatedColor;

  @override
  void initState() {
    defaultColor = _getNoteColor(widget.note);
    saturatedColor = HSVColor.fromColor(_getNoteColor(widget.note))
        .withSaturation(0.60)
        .toColor();
    super.initState();
  }

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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.00,
              0.05,
              0.2,
            ],
            colors: [
              defaultColor,
              saturatedColor,
              defaultColor,
            ],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blueGrey[900].withOpacity(0.20),
              offset: Offset(3.0, 3.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
      onTapDown: (tapDownDetails) {
        setState(() {
          print("TAP DOWN!");
          print(tapDownDetails.globalPosition);
          defaultColor = HSVColor.fromColor(_getNoteColor(widget.note))
              .withSaturation(0.75)
              .toColor();

          saturatedColor = _getNoteColor(widget.note);
        });
      },
      onTapCancel: () {
        setState(() {
          defaultColor = HSVColor.fromColor(_getNoteColor(widget.note))
              .withSaturation(0.75)
              .toColor();

          saturatedColor = _getNoteColor(widget.note);
        });
      },
      onTapUp: (tapUpDetails) {
        setState(() {
          defaultColor = _getNoteColor(widget.note);
          saturatedColor = HSVColor.fromColor(_getNoteColor(widget.note))
              .withSaturation(0.60)
              .toColor();
        });
      },
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
      return Colors.yellow[800];
    case 7:
      return Colors.orange[800];
  }
  return Colors.black;
}
