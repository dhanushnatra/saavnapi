import 'package:saavnapi/src/helper.dart';

class Songs {
  final List<Song> songs;
  Songs({required this.songs});
  factory Songs.fromJsonlist(List<dynamic> json) {
    return Songs(songs: json.map((e) => Song.fromJson(e)).toList());
  }
}

class Song {
  final String id;
  final String title;
  final String imageUrl;
  final String url;
  final String language;
  final String duration;
  final String artist;
  Song({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.duration,
    required this.language,
    required this.artist,
  });
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as String,
      title: (json['title'] as String).replaceAll("&quot;", ""),
      imageUrl: json['image'] as String,
      url: decrypt(json["more_info"]['encrypted_media_url'], "_160"),
      duration: json["more_info"]['duration'],
      artist:
          json["more_info"]["artistMap"]["primary_artists"][0]["name"] ??
          (json["more_info"]["artistMap"]["artists"] as List)
              .map((e) => e["name"])
              .join(","),
      language: json["language"] as String,
    );
  }
  Map toJson() {
    return {
      "id": id,
      "title": title,
      "imageUrl": imageUrl,
      "url": url,
      "duration": duration,
      "language": language,
      "artist": artist,
    };
  }
}
