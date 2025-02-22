import 'package:saavnapi/src/models/Song.dart';

class Artist {
  final String id;
  final String title;
  final String imageUrl;
  Artist({required this.id, required this.title, required this.imageUrl});
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['artistId'] as String,
      title: json['name'] as String,
      imageUrl: json['image'] as String,
    );
  }
  Map toJson() {
    return {"id": id, "title": title, "imageUrl": imageUrl};
  }
}

class Artists {
  final List<Artist> artists;
  Artists({required this.artists});
  factory Artists.fromJsonlist(List<dynamic> json) {
    return Artists(artists: json.map((e) => Artist.fromJson(e)).toList());
  }
}

class ArtistWithSongs {
  final Artist artist;
  final Songs songs;
  ArtistWithSongs({required this.artist, required this.songs});
  factory ArtistWithSongs.fromJson(Map<String, dynamic> json) {
    print(json);
    return ArtistWithSongs(
      artist: Artist.fromJson(json),
      songs: Songs.fromJsonlist(json["topSongs"]["songs"]),
    );
  }
}
