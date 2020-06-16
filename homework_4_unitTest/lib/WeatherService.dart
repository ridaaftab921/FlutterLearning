import 'dart:convert';
import 'package:homework_4/Weather.dart';
import 'package:homework_4/main.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String _apiKey;

  WeatherService(this._apiKey);

  Future<Weather> fetchWeatherData(String city) async {
    String url = 'http://api.openweathermap.org/data/2.5/weather?' +
        'q=$city&units=metric&' +
        'appid=$_apiKey';
    final response = await client.get(url);

    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      var weatherObj = Weather.fromJson(jsonBody);
      return weatherObj;
    }
    else {
      throw Exception('Failed to load data');
    }
  }
}