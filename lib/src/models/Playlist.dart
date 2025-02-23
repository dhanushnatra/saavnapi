import 'package:saavnapi/src/models/Song.dart';

class Playlist {
  final String id;
  final String title;
  final String imageUrl;
  Playlist({required this.id, required this.title, required this.imageUrl});
  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image'] as String,
    );
  }
  Map toJson() {
    return {"id": id, "title": title, "imageUrl": imageUrl};
  }
}

class Playlists {
  final List<Playlist> playlists;
  Playlists({required this.playlists});
  factory Playlists.fromJsonlist(List<dynamic> json) {
    return Playlists(playlists: json.map((e) => Playlist.fromJson(e)).toList());
  }
}

class PlaylistWithSongs {
  final Playlist playlist;
  final Songs songs;
  PlaylistWithSongs({required this.playlist, required this.songs});
  factory PlaylistWithSongs.fromJson(Map<String, dynamic> json) {
    return PlaylistWithSongs(
      playlist: Playlist.fromJson(json),
      songs: Songs.fromJsonlist(json["list"]),
    );
  }
}
