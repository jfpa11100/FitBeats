import 'package:flutter/material.dart';
import '../models/song_model.dart';

class ReproductorController extends ChangeNotifier {

  bool isFavorite = false;
  List<SongModel> _songs = [
    SongModel(title: "Overdrive", artist: "Beyond feat", duration: "3:45"),
    SongModel(title: "Ignite", artist: "The Reworkers", duration: "2:40"),
    SongModel(title: "Strong Now", artist: "Fortifiers", duration: "3:37"),
    SongModel(title: "Keep Moving On", artist: "Pushers", duration: "3:25"),
    SongModel(title: "prueba", artist: "Pushers", duration: "3:25"),
  ];

  List<SongModel> get songs => _songs;

  toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  togglePlay(SongModel song) {
    _songs = _songs.map((s) {
      if (s == song) {
        return s.copyWith(isPlaying: !s.isPlaying);
      } else {
        return s.copyWith(isPlaying: false);
      }
    }).toList();
    notifyListeners();
  }
}
