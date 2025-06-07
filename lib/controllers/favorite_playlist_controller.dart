// /lib/controller/favorite_playlist_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';

class FavoritePlaylistController extends StateNotifier<List<Playlist>> {
  FavoritePlaylistController()
      : super([
          Playlist(
            title: 'Power Boost para Correr Bajo la Lluvia',
            addedAt: '2025-05-04',
            image: 'assets/images/runner.png',
          ),
          Playlist(
            title: 'Energía Total de Lunes',
            addedAt: '2025-05-02',
            image: 'assets/images/walk.png',
          ),
          Playlist(
            title: 'Solo Hits para Hacer Yoga',
            addedAt: '2025-04-01',
            image: 'assets/images/yoga.png',
          ),
          Playlist(
            title: 'Crossover para Hacer Hiit',
            addedAt: '2025-04-28',
            image: 'assets/images/hiit.png',
          ),
          Playlist(
            title: 'Rock Pesado para Correr',
            addedAt: '2025-03-09',
            image: 'assets/images/runner.png',
          ),
          Playlist(
            title: 'Pruebita',
            addedAt: '2025-03-09',
            image: 'assets/images/runner.png',
          ),
        ]);

  void toggleFavorite(int index) {
    final updated = [...state];
    updated[index].isFavorite = !updated[index].isFavorite;
    state = updated;
  }
}
