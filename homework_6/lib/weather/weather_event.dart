import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherCallEvent extends WeatherEvent {
  final String city;

  WeatherCallEvent({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}