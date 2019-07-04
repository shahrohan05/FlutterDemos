import 'package:fire_chat/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.message, this.sender, this.fromOthers});

  final String message;
  final String sender;

  final bool fromOthers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment:
            fromOthers ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12.0,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topRight: fromOthers ? Radius.circular(20.0) : Radius.zero,
              topLeft: fromOthers ? Radius.zero : Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            color:
                fromOthers ? Colors.grey[800] : kMainAccent.withOpacity(0.75),
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                message,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
