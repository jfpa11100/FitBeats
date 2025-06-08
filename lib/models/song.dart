import 'dart:convert';
import 'dart:math';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song {
  final String id;
  final String name;
  final List<Artist> artists;
  final int durationMs;

  Song({
    required this.id,
    required this.name,
    required this.artists,
    required this.durationMs,
  });

  Song copyWith({
    String? id,
    String? name,
    List<Artist>? artists,
    int? durationMs,
    bool? isPlaying,
  }) => Song(
    id: id ?? this.id,
    name: name ?? this.name,
    artists: artists ?? this.artists,
    durationMs: durationMs ?? this.durationMs,
  );

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    durationMs: json["duration_ms"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    "duration_ms": durationMs,
    "id": id,
    "name": name,
  };
}

class Artist {
  String id;
  String name;

  Artist({required this.id, required this.name});

  factory Artist.fromJson(Map<String, dynamic> json) =>
    Artist(
      id: json["id"] ?? Random().nextInt(1000000).toString(),
      name: json["name"] ?? 'No name',
    );

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
