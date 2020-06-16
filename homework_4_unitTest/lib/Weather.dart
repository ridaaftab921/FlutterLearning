
class Weather {

  String lat;
  String lon;
  String main;
  String description;
  String icon;
  String temp;
  String feelsLike;
  String tempMin;
  String tempMax;
  String pressure;
  String humidity;
  String city;


  Weather.fromJson(Map<String, dynamic> json) {
      lat = (json["coord"]["lat"]).toString();
      lon = (json["coord"]["lon"]).toString();
      main = json["weather"][0]["main"];
      description = json["weather"][0]["description"];
      icon = json["weather"][0]["icon"];
      temp = (json["main"]["temp"]).toString();
      feelsLike = (json["main"]["feels_like"]).toString();
      tempMin = (json["main"]["temp_min"]).toString();
      tempMax = (json["main"]["temp_max"]).toString();
      pressure = (json["main"]["pressure"]).toString();
      humidity = (json["main"]["humidity"]).toString();
      city = json["name"];
  }
}