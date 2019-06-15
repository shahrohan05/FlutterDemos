import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/network_helper.dart';

const String kOpenWeatherBaseUrl =
    'https://api.openweathermap.org/data/2.5/weather';
const String kOpenWeatherAppId = '4d590f7ff4d9b9d1cc81b408bd00acf8';

class Weather {
  String city;
  int temp;
  int weatherCondition;
  String icon;

  Future<void> updateForCityLocation(newCityName) async {
    var url =
        '$kOpenWeatherBaseUrl?q=$newCityName&appid=$kOpenWeatherAppId&units=metric';
    var responseData = await NetworkHelper(url: url).get();
    print(responseData);
    _updateWithOpenWeatherResponse(responseData);
  }

  Future<void> getWeatherFromNetwork(Location location) async {
    var url =
        '$kOpenWeatherBaseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kOpenWeatherAppId&units=metric';
    var responseData = await NetworkHelper(url: url).get();
    print(responseData);
    _updateWithOpenWeatherResponse(responseData);
  }

  void _updateWithOpenWeatherResponse(responseData) {
    this.city = responseData['name'];
    dynamic temp = responseData['main']['temp'];
    this.temp = temp.toInt();
    this.weatherCondition = responseData['weather'][0]['id'];
    this.icon = responseData['weather'][0]['icon'];
  }

  Weather({
    this.city,
    this.temp,
    this.weatherCondition,
    this.icon,
  });

  String getWeatherIcon() {
    String icon = '☀️';
    if (this.weatherCondition < 300) {
      icon = '⛈️';
    } else if (this.weatherCondition < 400) {
      icon = '🌧️';
    } else if (this.weatherCondition < 600) {
      icon = '🌧️';
    } else if (this.weatherCondition < 700) {
      icon = '🌨️';
    } else if (this.weatherCondition < 800) {
      icon = '🌫️';
    } else if (this.weatherCondition == 800) {
      icon = '☀️';
    } else if (this.weatherCondition > 800) {
      icon = '☁️';
    }

    return icon;
  }

  String get iconUrl {
    return 'http://openweathermap.org/img/w/$icon.png';
  }

  String getWeatherMessage() {
    String weather = '😊️ It\'s all good';
    if (this.temp > 40) {
      weather = '🔥️ It\'s hot as hell';
    } else if (this.temp > 35) {
      weather = '😨️ It\'s burning up';
    } else if (this.temp > 20) {
      weather = '😊️ It\'s all good';
    } else if (this.temp < 20) {
      weather = '❄️ It\'s cold';
    }
    return weather;
  }
}
