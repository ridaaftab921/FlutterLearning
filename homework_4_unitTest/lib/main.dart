import 'package:flutter/material.dart';
import 'package:homework_4/LoadingWidget.dart';
import 'package:homework_4/Weather.dart';
import 'package:homework_4/WeatherService.dart';

import 'package:http/http.dart' as http;
import 'WeatherWidget.dart';

http.Client client = http.Client();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool loadingState = true;
  bool errorState = false;
  Weather weather;
  final WeatherService weatherService = WeatherService("4a754dcf877b00ff18b80fe2d8fde209");
  List<String> cities = ["Lahore", "Karachi", "Islamabad", "Faisalabad", "Sahiwal", "Murree", "Hunza", "Gilgat"];
  String selectedCity = "Lahore";

  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  Future<void> loadWeatherData() async {
    try {
      errorState = false;
      final result = await weatherService.fetchWeatherData(selectedCity);
      setState(() {
        weather = result;
        if (result == null) {
          errorState = true;
        }
        loadingState = false;
      });
    }
    catch(error) {
      setState(() {
        errorState = false;
        loadingState = true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1.0],
              colors: [
                Colors.grey[400],
                Colors.grey[300],
                Colors.grey[200],
              ],
            )
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                key: Key('dropdown'),
                isExpanded: true,
                value: selectedCity,
                onChanged: (String newSelectedCity) {
                  setState(() {
                    loadingState = true;
                  });
                  selectedCity = newSelectedCity;
                  loadWeatherData();
                },
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: loadingState ? LoadingWidget().buildWidget() : errorState ? _errorState() : WeatherWidget.forWeather(weather).buildWidget(),
            ),
          ],
        ),
      ),
    );
  }


  _errorState() {
    return Center(
      child: Text(
        'Couldn\'t load weather data for ' + selectedCity + ' city',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16
        ),
      ),
    );
  }
}
