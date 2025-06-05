import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/weather_response.dart';

class WeatherApi {
  final String apiKey = dotenv.env['WEATHER_API_KEY']!;
  final String baseUrl = 'http://api.weatherapi.com/v1/current.json';

  Future<WeatherResponse> getWeather(String location) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?key=$apiKey&q=$location'),
      );
      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('An error occurred while fetching data from the API');
      }
    } catch (error) {
      throw Exception('An error occurred processing the data');
    }
  }
}
