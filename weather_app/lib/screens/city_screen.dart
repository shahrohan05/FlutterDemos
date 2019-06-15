import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: kLargeIconSize,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_city),
                  hintText: 'Enter City Name',
                ),
                onChanged: (String newVal) {
                  cityName = newVal;
                },
              ),
            ),
            Center(
              child: FlatButton(
                child: Text(
                  "Change Location",
                  style: kDisableLargeTextStyle,
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
