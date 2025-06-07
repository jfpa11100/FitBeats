import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';

class FavoritePlaylistController extends StateNotifier<List<Playlist>> {
  FavoritePlaylistController() : super([
    Playlist(
      id: '1',
      title: 'Power Boost para Correr Bajo la Lluvia',
      addedAt: '2025-05-04',
      image: 'assets/images/runner.png',
    ),
    Playlist(
      id: '2',
      title: 'Prueba',
      addedAt: '2025-03-09',
      image: 'assets/images/runner.png',
    ),
  ]);

  // Add favorite playlist
  void addToPlaylistFavoriteList(Playlist playlist) {
    if (!state.any((favoritePlaylist) => favoritePlaylist.id == playlist.id)) {
      state = [...state, playlist.copyWith(isFavorite: true)];
    }
  }

  // Delete from favorites
  void removeFromFavoritePlaylistList(Playlist playlist) {
    state = state
        .where((favoritePlaylist) => favoritePlaylist.id != playlist.id)
        .toList();
  }

  // Toggle favorite playlist state 
  void toggleFavoritePlaylist(Playlist playlist) {
    if (isFavorite(playlist.id)) {
      removeFromFavoritePlaylistList(playlist);
    } else {
      addToPlaylistFavoriteList(playlist);
    }
  }

  bool isFavorite(String playlistId) {
    return state.any((favoriteRecipe) => favoriteRecipe.id == playlistId);
  }

}
