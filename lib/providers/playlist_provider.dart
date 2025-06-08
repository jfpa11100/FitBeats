import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/playlist_controller.dart';
import 'package:myapp/models/playlist.dart';


final playlistProvider =
    AsyncNotifierProvider.family<PlaylistController, Playlist, String>(
      PlaylistController.new,
    );
