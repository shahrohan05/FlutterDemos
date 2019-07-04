import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String route = '/Chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _auth = FirebaseAuth.instance;
  var _firestore = Firestore.instance;
  String _enteredMessage = '';
  FirebaseUser _user;

  void getCurrentUser() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        _user = user;
        print(_user);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final QuerySnapshot messages =
        await _firestore.collection("chat").getDocuments();
    for (DocumentSnapshot message in messages.documents) {
      print(message.data);
    }
  }

  void getMessagesStream() async {
    await for (QuerySnapshot messages
        in _firestore.collection('chat').snapshots()) {
      for (DocumentSnapshot message in messages.documents) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Builder(
        builder: (context) => Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection('chat').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              child: CircularProgressIndicator(),
                            );
                          }

                          List<Text> messagesWidgets = [];

                          for (DocumentSnapshot message
                              in snapshot.data.documents) {
                            messagesWidgets.add(Text(
                                '${message.data['text']} from ${message.data['sender']}'));
                          }
                          return Column(
                            children: messagesWidgets,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey[900],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: null,
                              decoration: InputDecoration(),
                              onChanged: (value) {
                                _enteredMessage = value;
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (_enteredMessage == "") {}
                            _firestore.collection('chat').add({
                              'sender': _user.email,
                              'text': _enteredMessage,
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }
}
