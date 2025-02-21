import 'package:saavnapi/src/models/Song.dart';

class Playlist {
  final String id;
  final String title;
  final String imageUrl;
  final Songs songs;
  Playlist({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.songs,
  });
  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image'] as String,
      songs: Songs.fromJsonlist(json["list"]),
    );
  }
  Map toJson() {
    return {"id": id, "title": title, "imageUrl": imageUrl, "songs": songs};
  }
}

class Playlists {
  final List<Playlist> playlists;
  Playlists({required this.playlists});
  factory Playlists.fromJsonlist(List<dynamic> json) {
    return Playlists(playlists: json.map((e) => Playlist.fromJson(e)).toList());
  }
}
