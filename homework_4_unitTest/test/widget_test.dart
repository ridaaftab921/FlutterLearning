// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homework_4/Weather.dart';
import 'package:homework_4/WeatherService.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:homework_4/main.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Lahore'), findsOneWidget);

    expect(find.byKey(Key('dropdown')), findsOneWidget);

    await tester.tap(find.byKey(Key('dropdown')));
    await tester.pump();
    expect(find.text('Karachi'), findsWidgets);
    expect(find.text('Islamabad'), findsWidgets);
    expect(find.text('Faisalabad'), findsWidgets);
    expect(find.text('Sahiwal'), findsWidgets);
    expect(find.text('Murree'), findsWidgets);
    expect(find.text('Hunza'), findsWidgets);
    expect(find.text('Gilgat'), findsWidgets);

  });

  group('loadWeatherData', (){

    test('Weather api completes successfully', () async {
      final mockClient = MockClient();

      String WEATHER_DETAILS_URL = 'http://api.openweathermap.org/data/2.5/weather?q=Karachi&units=metric&appid=4a754dcf877b00ff18b80fe2d8fde209';
      String WEATHER_DETAILS_RESPONSE = '{"coord":{"lon":67.08,"lat":24.91},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"base":"stations","main":{"temp":31,"feels_like":34.12,"temp_min":31,"temp_max":31,"pressure":999,"humidity":70},"visibility":6000,"wind":{"speed":4.6,"deg":240},"clouds":{"all":20},"dt":1592236003,"sys":{"type":1,"id":7576,"country":"PK","sunrise":1592181719,"sunset":1592230951},"timezone":18000,"id":1174872,"name":"Karachi","cod":200}';

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(mockClient.get(WEATHER_DETAILS_URL))
          .thenAnswer((_) async => http.Response(WEATHER_DETAILS_RESPONSE, 200));
      client = mockClient;
      WeatherService service = WeatherService("4a754dcf877b00ff18b80fe2d8fde209");
      expect(await service.fetchWeatherData("Karachi"), isA<Weather>());

    });

  });

  group('loadWeatherData', (){

    test('Weather api completes failure', () async {
      final mockClient = MockClient();

      String WEATHER_DETAILS_URL = 'http://api.openweathermap.org/data/2.5/weather?q=Karachi&units=metric&appid=4a754dcf877b00ff18b80fe2d8fe209';

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(mockClient.get(WEATHER_DETAILS_URL))
          .thenAnswer((_) async => http.Response('Not found', 404));
      client = mockClient;
      WeatherService service = WeatherService("4a754dcf877bf18b80fe2d8fde209");
      expect(service.fetchWeatherData("Karach"), throwsException);
    });
  });

}
