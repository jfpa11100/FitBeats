import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
  String id;
  String title;
  String? image;
  String? addedAt;
  bool isFavorite;

  Playlist({
    required this.id,
    required this.title,
    this.image,
    this.addedAt,
    this.isFavorite = false,
  });

  Playlist copyWith({
    String? id,
    String? title,
    String? image,
    String? addedAt,
    bool? isFavorite,
  }) {
    return Playlist(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      addedAt: addedAt ?? this.addedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    id: json["id"],
    title: json["name"],
    image: json["image"],
    addedAt: json["addedAt"],
    isFavorite: json["addedAt"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": title,
    "image": image,
    "addedAt": addedAt,
    "isFavorite": isFavorite,
  };
}
