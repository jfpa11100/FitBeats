import 'dart:convert';

Playlist playlistFromJson(String str) => Playlist.fromJson(json.decode(str));

String playlistToJson(Playlist data) => json.encode(data.toJson());

class Playlist {
    String description;
    String id;
    String name;

    Playlist({
        required this.description,
        required this.id,
        required this.name,
    });

    factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        description: json["description"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "name": name,
    };
}


class Tracks {
    String href;
    int total;

    Tracks({
        required this.href,
        required this.total,
    });

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
    };
}
