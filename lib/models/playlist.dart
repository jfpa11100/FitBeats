import 'dart:convert';
import 'dart:math';
import 'package:myapp/models/song.dart';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
  String id;
  String title;
  String? image;
  String? addedAt;
  bool isFavorite;
  List<Song> songs;

  Playlist({
    required this.id,
    required this.title,
    this.image,
    this.addedAt,
    this.isFavorite = false,
    this.songs = const [],
  });

  Playlist copyWith({
    String? id,
    String? title,
    String? image,
    String? addedAt,
    bool? isFavorite,
    List<Song>? songs,
  }) {
    return Playlist(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      addedAt: addedAt ?? this.addedAt,
      isFavorite: isFavorite ?? this.isFavorite,
      songs: songs ?? this.songs,
    );
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json["id"] ?? Random().nextInt(1000000).toString(),
      title: json["name"] ?? 'No name',
      image: json["image"] ?? '',
      addedAt: json["addedAt"] ?? '',
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": title,
    "image": image,
    "addedAt": addedAt,
    "isFavorite": isFavorite,
  };
}