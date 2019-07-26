import 'package:flutter/material.dart';
/*import 'package:url_launcher/url_launcher.dart' as urlLauncher;*/

class StoryCard extends StatelessWidget {
  StoryCard({this.title, this.imageUrl, this.url});
  final String title;
  final String imageUrl;
  final String url;

  _launchUrl(url) async {
    print('tapped link $url');
    /*if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[900],
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 15.0,
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.blueGrey[900],
                    offset: Offset(0.0, 0.0),
                    spreadRadius: -3.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.0),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
