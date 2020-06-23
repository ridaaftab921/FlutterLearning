import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_6/WeatherService.dart';
import 'weather_event.dart';
import 'weather_state.dart';
import 'package:homework_6/Weather.dart';

class WeatherBloc extends Bloc<WeatherEvent , WeatherState> {

  @override
  WeatherState get initialState => WeatherInProgress();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event)
  async*
  {
    if(event is WeatherCallEvent) {
      yield WeatherInProgress();
      WeatherService weatherService = WeatherService("4a754dcf877b00ff18b80fe2d8fde209");
      Weather weather = await weatherService.fetchWeatherData(event.city);
      if(weather == null) {
        yield WeatherFailure();
      } else {
        yield WeatherSuccessful(weather: weather);
      }
    }
  }

}