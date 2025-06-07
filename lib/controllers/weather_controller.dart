import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/api/weather_api.dart';
import 'package:myapp/models/weather_response.dart';

class WeatherController extends FamilyAsyncNotifier<WeatherResponse, String> {
  @override
  Future<WeatherResponse> build(String location) async {
    ref.keepAlive();
    return await WeatherApi().getWeather(location);
  }
}
