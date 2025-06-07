import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/controllers/favorite_playlist_controller.dart';

final favoritePlaylistProvider =
    StateNotifierProvider<FavoritePlaylistController, List<Playlist>>(
  (ref) => FavoritePlaylistController(),
);
