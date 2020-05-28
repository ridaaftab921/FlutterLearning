import 'dart:convert';
import 'package:homework_4/Weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String _apiKey;

  WeatherService(this._apiKey);

  Future<Weather> fetchWeatherData(String city) async {
    String url = 'http://api.openweathermap.org/data/2.5/weather?' +
        'q=$city&units=metric&' +
        'appid=$_apiKey';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      var weatherObj = Weather.fromJson(jsonBody);
      return weatherObj;
    } else {
      return null;
    }
  }
}