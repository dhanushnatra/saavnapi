import 'package:saavnapi/src/models/Song.dart';

class Album {
  final String id;
  final String title;
  final String imageUrl;
  final Songs songs;
  Album({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.songs,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
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

class Albums {
  final List<Album> albums;
  Albums({required this.albums});
  factory Albums.fromJsonlist(List<dynamic> json) {
    return Albums(albums: json.map((e) => Album.fromJson(e)).toList());
  }
}
