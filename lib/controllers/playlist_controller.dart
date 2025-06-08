import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/api/music_api.dart';
import 'package:myapp/models/playlist.dart';

class PlaylistController extends FamilyAsyncNotifier<Playlist, String> {
  static const int _maxRetries = 3;

  @override
  FutureOr<Playlist> build(String query) async {
    return _searchWithFallback(query, retries: _maxRetries);
  }

  Future<Playlist> _searchWithFallback(String query, {required int retries}) async {
    if (retries == 0) {
      throw Exception('No se encontraron playlists\nintenta con opciones diferentes.');
    }

    final List<Playlist> playlists = await MusicApi().searchPlaylists(query);

    if (playlists.isNotEmpty) {
      for (final playlist in playlists) {
        final songs = await MusicApi().getPlaylistSongs(playlist.id);
        if (songs.isNotEmpty) {
          debugPrint("Songs found $songs for playlist: ${playlist.title}");
          return playlist.copyWith(songs: songs);
        }
      }
    }

    // Try with the first word removed from the query
    final updatedQuery = query.split(' ').skip(1).join(' ');
    return _searchWithFallback(updatedQuery, retries: retries - 1);
  }
}