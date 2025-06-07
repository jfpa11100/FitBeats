class SongModel {
  final String title;
  final String artist;
  final String duration;
  final bool isPlaying;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    this.isPlaying = false,
  });

  SongModel copyWith({bool? isPlaying}) => SongModel(
        title: title,
        artist: artist,
        duration: duration,
        isPlaying: isPlaying ?? this.isPlaying,
      );
}