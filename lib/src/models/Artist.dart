import 'package:saavnapi/src/models/Song.dart';

class Artist {
  final String id;
  final String title;
  final String imageUrl;
  final Songs songs;
  Artist({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.songs,
  });
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['artistId'] as String,
      title: json['name'] as String,
      imageUrl: json['image'] as String,
      songs: Songs.fromJsonlist(json["topSongs"]["songs"]),
    );
  }
  Map toJson() {
    return {"id": id, "title": title, "imageUrl": imageUrl, "songs": songs};
  }
}

class Artists {
  final List<Artist> artists;
  Artists({required this.artists});
  factory Artists.fromJsonlist(List<dynamic> json) {
    return Artists(artists: json.map((e) => Artist.fromJson(e)).toList());
  }
}
