import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/song.dart';
import 'package:myapp/controllers/states/reproductor_state.dart';

class ReproductorController extends StateNotifier<ReproductorState> {

  ReproductorController() : super(ReproductorState());

  togglePlay(Song song) {
    if (state.currentSong?.id == song.id) {
      // change play/pause if is the same song
      state = state.copyWith(isPlaying: !state.isPlaying);
    } else {
      // if is another song change current and play it
      state = ReproductorState(currentSong: song, isPlaying: true);
    }
  }

  pause() {
    if (state.isPlaying) {
      state = state.copyWith(isPlaying: false);
    }
  }

  play() {
    if (!state.isPlaying && state.currentSong != null) {
      state = state.copyWith(isPlaying: true);
    }
  }
}
