import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_6/FailureWidget.dart';
import 'package:homework_6/LoadingWidget.dart';
import 'package:homework_6/WeatherWidget.dart';
import 'package:homework_6/weather/weather_bloc.dart';
import 'package:homework_6/weather/weather_state.dart';
import 'package:homework_6/weather/weather_event.dart';

import 'package:http/http.dart' as http;
http.Client client = http.Client();

class SimpleBlocDelegate extends BlocDelegate {
  @override
    void onEvent(Bloc bloc, Object event) {
      print(event);
      super.onEvent(bloc, event);
    }

    @override
    void onTransition(Bloc bloc, Transition transition) {
      print(transition);
      super.onTransition(bloc, transition);
    }

    @override
    void onError(Bloc bloc, Object error, StackTrace stackTrace) {
      print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
      BlocProvider<WeatherBloc>(
        create: (context) {
          return WeatherBloc()..add(WeatherCallEvent(city: "Lahore"));
        },
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<WeatherBloc , WeatherState>(
        builder: (context , state) {
          if (state is WeatherInProgress) {
            return LoadingWidget();
          }
          if (state is WeatherSuccessful) {
            return WeatherWidget(response: state.weather);
          }
          if (state is WeatherFailure) {
            return FailureWidget();
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
