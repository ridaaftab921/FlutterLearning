import 'package:flutter/material.dart';
import 'Weather.dart';

class WeatherWidget {
  WeatherWidget.forWeather(Weather weather) {
    weatherObj = weather;
  }

  Weather weatherObj;

  Widget buildWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Text(
            weatherObj.city,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                weatherObj.main,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              Text(
                '   (' + weatherObj.description + ')',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'http://openweathermap.org/img/wn/' + weatherObj.icon + '@2x.png',
                scale: 0.9,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  weatherObj.temp + '°C',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'min: ' + weatherObj.tempMin + '°C',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'max: ' + weatherObj.tempMax + '°C',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 180,
          child: GridView.count(
            crossAxisCount: 3,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(),

                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.ac_unit),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Feels like'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(weatherObj.feelsLike + '°C'),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(),

                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.shutter_speed),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Pressure'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(weatherObj.pressure),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(),

                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.opacity),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Humidity'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(weatherObj.humidity),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}