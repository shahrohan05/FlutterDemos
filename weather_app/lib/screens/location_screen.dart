import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utils/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weather);

  final Weather weather;

  @override
  State<StatefulWidget> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  String weatherEmoji = '☀';
  String cityName = 'Little Wadia';
  String weatherCondition = 'It\'s sunny and bright outside';

  void updateWeatherOnLocationUpdate() async {
    Location location = Location();
    await location.getLocation();
    await widget.weather.getWeatherFromNetwork(location);
  }

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
                    icon: Icon(Icons.near_me),
                    iconSize: kLargeIconSize,
                    onPressed: () {
                      setState(() {
                        updateWeatherOnLocationUpdate();
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.location_city),
                    iconSize: kLargeIconSize,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                    },
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
                        '${widget.weather.temp}°',
                        style: kSuperLargeTextStyle,
                      ),
                      Text(
                        widget.weather.getWeatherIcon(),
                        style: kLargeEmojiTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: kLargeTextPaddingRightAligned,
                child: Text(
                  '${widget.weather.getWeatherMessage()} in ${widget.weather.city}',
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
