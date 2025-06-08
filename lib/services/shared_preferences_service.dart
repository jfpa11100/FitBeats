import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/models/playlist.dart';

class SharedPreferencesService {
  static const _favoriteKey = 'favoritePlaylists';


  Future<void> saveFavoritePlaylists(List<Playlist> playlists) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = playlists.map((playlist) => playlistToJson(playlist)).toList();
    await prefs.setStringList(_favoriteKey, jsonList);
  }

  Future<List<Playlist>> loadFavoritePlaylists() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_favoriteKey) ?? [];
    return jsonList.map((jsonString) => playlistFromJson(jsonString)).toList();
  }

  Future<void> removeFavoritePlaylists() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoriteKey);
  }
}
