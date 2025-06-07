import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
    String description;
    String id;
    String title;

    Playlist({
        required this.description,
        required this.id,
        required this.title,
    });

    factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        description: json["description"],
        id: json["id"],
        title: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": title,
    };
}