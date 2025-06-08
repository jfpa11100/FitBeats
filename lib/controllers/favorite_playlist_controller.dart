import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/services/shared_preferences_service.dart';

class FavoritePlaylistController extends StateNotifier<List<Playlist>> {
  final SharedPreferencesService _prefsService;

  FavoritePlaylistController(this._prefsService) : super([]) {
    _loadFavorites();
  }

  // Cargar los favoritos desde SharedPreferences
  Future<void> _loadFavorites() async {
    final favoritePlaylists = await _prefsService.loadFavoritePlaylists();
    if (favoritePlaylists.isEmpty) {
      state = [];
    } else {
      state = favoritePlaylists;
    }
  }

  // Guardar la lista de favoritos en SharedPreferences
  Future<void> _saveFavorites() async {
    await _prefsService.saveFavoritePlaylists(state);
  }

  // Agregar una playlist a los favoritos
  void addToPlaylistFavoriteList(Playlist playlist) {
    if (!state.any((favoritePlaylist) => favoritePlaylist.id == playlist.id)) {
      state = [...state, playlist.copyWith(isFavorite: true, addedAt: DateTime.now().toString())];
      _saveFavorites();
    }
  }

  // Eliminar una playlist de los favoritos
  void removeFromFavoritePlaylistList(Playlist playlist) {
    state =
        state
            .where((favoritePlaylist) => favoritePlaylist.id != playlist.id)
            .toList();
    _saveFavorites();
  }

  void toggleFavoritePlaylist(Playlist playlist) {
    if (isFavorite(playlist)) {
      removeFromFavoritePlaylistList(playlist);
    } else {
      addToPlaylistFavoriteList(playlist);
    }
  }

  bool isFavorite(Playlist playlist) => state.any((p) => p.id == playlist.id);
}
