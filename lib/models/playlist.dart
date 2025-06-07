class Playlist {
  final String title;
  final String addedAt;
  final String image;
  bool isFavorite;

  Playlist({
    required this.title,
    required this.addedAt,
    required this.image,
    this.isFavorite = true,
  });
}
