import 'dart:convert';

WeatherResponse weatherResponseFromJson(String str) => WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) => json.encode(data.toJson());

class WeatherResponse {
    Location location;
    Current current;

    WeatherResponse({
        required this.location,
        required this.current,
    });

    factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    double tempC;
    int isDay;
    Condition condition;
    double windKph;
    int windDegree;
    String windDir;
    double precipMm;
    int humidity;
    int cloud;
    double feelslikeC;
    double windchillC;
    double heatindexC;
    double dewpointC;
    double visKm;
    double uv;
    double gustKph;

    Current({
        required this.tempC,
        required this.isDay,
        required this.condition,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.precipMm,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.windchillC,
        required this.heatindexC,
        required this.dewpointC,
        required this.visKm,
        required this.uv,
        required this.gustKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        precipMm: json["precip_mm"]?.toDouble(),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        heatindexC: json["heatindex_c"]?.toDouble(),
        dewpointC: json["dewpoint_c"]?.toDouble(),
        visKm: json["vis_km"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "precip_mm": precipMm,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "windchill_c": windchillC,
        "heatindex_c": heatindexC,
        "dewpoint_c": dewpointC,
        "vis_km": visKm,
        "uv": uv,
        "gust_kph": gustKph,
    };
}

class Condition {
    String text;
    String icon;
    int code;

    Condition({
        required this.text,
        required this.icon,
        required this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Location {
    String name;
    String region;
    String country;
    double lat;
    double lon;
    String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.localtime,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "localtime": localtime,
    };
}