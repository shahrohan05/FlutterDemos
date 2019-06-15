import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    location.printLocation();
    getWeather(location);
  }

  void getWeather(Location location) async {
    print("getting weather");
    Weather weather = Weather();
    await weather.getWeatherFromNetwork(location);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weather);
        },
      ),
    );
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader3,
          ),
        ),
      ),
    );
  }
}
