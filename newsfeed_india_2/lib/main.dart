import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import 'network_helper.dart';
import 'story_card.dart';

void main() {
  Admob.initialize('ca-app-pub-2018336404134429~3810854591');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<dynamic> newsFeed = [];

  getNewsFeed() async {
    newsFeed = await NetworkHelper.getNewsFeed();
    print(newsFeed);
    print("NF L : ${newsFeed.length}");
    setState(() {});
  }

  _launchUrl(url) async {
    print('tapped link $url');
    /*if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    }*/
  }

  @override
  void initState() {
    getNewsFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Stories - India'),
      ),
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: newsFeed.length,
              itemBuilder: (context, index) {
                if (newsFeed != null && newsFeed.length > 0) {
                  var newsItem = newsFeed[index];
                  if (index != 0 && index % 5 == 0) {
                    return Card(
                      elevation: 7.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      color: Colors.blueGrey[900],
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 36.0,
                        ),
                        child: AdmobBanner(
                            adUnitId: 'ca-app-pub-3940256099942544/6300978111',
                            adSize: AdmobBannerSize.LARGE_BANNER),
                      ),
                    );
                  } else {
                    return StoryCard(
                      title: newsItem['title'],
                      imageUrl: newsItem['urlToImage'],
                      url: newsItem['url'],
                    );
                  }
                } else {
                  return Text('');
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 12.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => _launchUrl('https://newsapi.org/'),
              child: Text(
                'Powered by NewsAPI.org',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey[200],
                  fontStyle: FontStyle.italic,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
