import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  String weatherEmoji = '☀';
  String cityName = 'Little Wadia';
  String weatherCondition = 'It\'s sunny and bright outside';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/calm-and-nice-weather.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit_location),
                    iconSize: kLargeIconSize,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.location_city),
                    iconSize: kLargeIconSize,
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '32°',
                        style: kSuperLargeTextStyle,
                      ),
                      Text(
                        weatherEmoji,
                        style: kLargeEmojiTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: kLargeTextPaddingRightAligned,
                child: Text(
                  '$weatherCondition in $cityName',
                  style: kLargeFontTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
