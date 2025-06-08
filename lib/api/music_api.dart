import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/song.dart';
import 'package:myapp/models/playlist.dart';

class MusicApi {
  // Singleton pattern to ensure only one instance of MusicApi exists and share apikey each call
  static final MusicApi _instance = MusicApi._internal();
  factory MusicApi() => _instance;
  MusicApi._internal();

  static String? _apiKey;
  final String baseUrl = 'https://api.spotify.com/v1';

  Future<void> _ensureToken() async {
    if (_apiKey == null) await _getToken();
  }

  // Query example: "sad rain running"
  // Query example: "happy rain running"
  // Query example: "happy sunny running"
  Future<List<Playlist>> searchPlaylists(String query) async {
    await _ensureToken();

    final response = await http.get(
      Uri.parse('$baseUrl/search?q=$query&type=playlist'),
      headers: {'Authorization': 'Bearer $_apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList =
          jsonDecode(response.body)['playlists']['items'];
      return jsonList.map((json) => Playlist.fromJson(json)).toList();
    } else if (response.statusCode == 401) {
      await _getToken();
      return searchPlaylists(query);
    } else {
      debugPrint('Search failed: ${response.body}');
      throw Exception('Error buscando playlists');
    }
  }

  Future<List<Song>> getPlaylistSongs(String playlistId) async {
    await _ensureToken();

    final response = await http.get(
      Uri.parse('$baseUrl/playlists/$playlistId/tracks'),
      headers: {'Authorization': 'Bearer $_apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> items = jsonDecode(response.body)["items"];
      return items.map((item) => Song.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      await _getToken();
      return getPlaylistSongs(playlistId);
    } else {
      debugPrint('Error canciones: ${response.body}');
      throw Exception('Error obteniendo canciones');
    }
  }

  Future<void> _getToken() async {
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
      _apiKey = data['access_token'];
    }
  }
}
