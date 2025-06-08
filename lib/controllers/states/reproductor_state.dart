import 'package:myapp/models/song.dart';

class ReproductorState {
  final Song? currentSong;
  final bool isPlaying;

  ReproductorState({this.currentSong, this.isPlaying = false});

  ReproductorState copyWith({Song? currentSong, bool? isPlaying}) {
    return ReproductorState(
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}