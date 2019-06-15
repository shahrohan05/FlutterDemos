import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/network_helper.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    await location.getLocation();
    location.printLocation();
    getWeather();
  }

  void getWeather() async {
    var longitude = location.longitude;
    var latitude = location.latitude;
    print("getting weather");
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=4d590f7ff4d9b9d1cc81b408bd00acf8';
    var responseData = await NetworkHelper(url: url).get();
    print(responseData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
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
