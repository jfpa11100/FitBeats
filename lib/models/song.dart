import 'dart:convert';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song {
    Track track;

    Song({
        required this.track,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        track: Track.fromJson(json["track"]),
    );

    Map<String, dynamic> toJson() => {
        "track": track.toJson(),
    };
}

class Track {
    dynamic previewUrl;
    List<Artist> artists;
    int durationMs;
    ExternalUrls externalUrls;
    String href;
    String id;
    String name;

    Track({
        required this.previewUrl,
        required this.artists,
        required this.durationMs,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        previewUrl: json["preview_url"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        durationMs: json["duration_ms"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "preview_url": previewUrl,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "duration_ms": durationMs,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
    };
}

class Artist {
    String id;
    String name;

    Artist({
        required this.id,
        required this.name,
    });

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ExternalUrls {
    String spotify;

    ExternalUrls({
        required this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}