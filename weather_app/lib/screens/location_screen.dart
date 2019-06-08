import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('User\'s Position: $position');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('GET LOCATION'),
            onPressed: () {
              getLocation();
            },
          ),
        ),
      ),
    );
  }
}
