import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/weather_controller.dart';
import 'package:myapp/models/weather_response.dart';

final weatherProvider =
    AsyncNotifierProvider.family<WeatherController, WeatherResponse, String>(
      WeatherController.new,
    );
