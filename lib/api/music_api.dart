import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/song.dart';
import 'package:myapp/models/playlist.dart';

class WeatherApi {
  static String? apiKey;
  final String baseUrl = 'https://api.spotify.com/v1';

  // Query example: "sad rain running"
  // Query example: "happy rain running"
  // Query example: "happy sunny running"
  Future<List<Playlist>> searchPlaylists(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?q=$query&type=playlist'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> listOfJson =
            jsonDecode(response.body)['playlists']['items'] as List;
        return listOfJson.map((json) => Playlist.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        getToken();
        return searchPlaylists(query);
      } else {
        throw Exception('An error occurred while fetching data from the API');
      }
    } catch (error) {
      throw Exception('An error occurred processing the data');
    }
  }

  Future<List<Song>> getPlaylistSongs(String playlistId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/playlists/$playlistId/tracks'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> listOfJson =
            jsonDecode(response.body)['items'] as List;
        return listOfJson.map((json) => Song.fromJson(json)).toList();
      } else if (response.statusCode == 401) {
        getToken();
        return getPlaylistSongs(playlistId);
      } else {
        throw Exception('An error occurred while fetching data from the API');
      }
    } catch (error) {
      throw Exception('An error occurred processing the data');
    }
  }

  void getToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'client_credentials',
          'client_id': dotenv.env['SPOTIFY_CLIENT_ID'],
          'client_secret': dotenv.env['SPOTIFY_CLIENT_SECRET'],
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        WeatherApi.apiKey = data['access_token'];
      } else {
        throw Exception(
          'An error occurred while fetching the token from the API',
        );
      }
    } catch (error) {
      throw Exception('An error occurred processing the token');
    }
  }
}
