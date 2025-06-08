import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/favorite_playlist_controller.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/services/shared_preferences_service.dart';


final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});


final favoritePlaylistProvider = StateNotifierProvider<FavoritePlaylistController, List<Playlist>>(
  (ref) {
    
    final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
    return FavoritePlaylistController(sharedPreferencesService);
  },
);
