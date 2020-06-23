import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework_6/Weather.dart';

abstract class WeatherState extends Equatable{

  @override
  List<Object> get props => [];
}

class WeatherInProgress extends WeatherState {}

class WeatherSuccessful extends WeatherState {
  final Weather weather;

  WeatherSuccessful({@required this.weather}): assert(weather != null);

  @override
  List<Object> get props => [Weather];
}

class WeatherFailure extends WeatherState {}