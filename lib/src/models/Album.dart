import 'package:saavnapi/src/models/Song.dart';

class Album {
  final String id;
  final String title;
  final String imageUrl;
  Album({required this.id, required this.title, required this.imageUrl});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image'] as String,
    );
  }
  Map toJson() {
    return {"id": id, "title": title, "imageUrl": imageUrl};
  }
}

class Albums {
  final List<Album> albums;
  Albums({required this.albums});
  factory Albums.fromJsonlist(List<dynamic> json) {
    return Albums(albums: json.map((e) => Album.fromJson(e)).toList());
  }
}

class AlbumWithSongs {
  final Album album;
  final Songs songs;
  AlbumWithSongs({required this.album, required this.songs});
  factory AlbumWithSongs.fromJson(Map<String, dynamic> json) {
    return AlbumWithSongs(
      album: Album.fromJson(json),
      songs: Songs.fromJsonlist(json["list"]),
    );
  }
}
