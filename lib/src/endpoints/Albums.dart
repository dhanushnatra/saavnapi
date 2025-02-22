import 'package:saavnapi/src/models/Album.dart';
import 'package:saavnapi/src/client.dart';
import 'package:saavnapi/src/apiends.dart';

class AlbumsEnd extends BaseClient {
  Future<Albums> fetchAlbums(
    String query, {
    String n = "20",
    String p = "1",
  }) async {
    final response = await request(
      call: endpoints.search.albums,
      params: {'q': query.replaceAll(" ", "+"), 'n': n, 'p': p},
    );
    return Albums.fromJsonlist(response["results"]);
  }

  Future<Albums> trending({String language = "telugu"}) async {
    final response = await requestlist(
      call: endpoints.trending,
      language: language,
      params: {'entity_type': "album"},
    );
    return Albums.fromJsonlist(response);
  }

  Future<Album> albumById(String id) async {
    final response = await request(
      call: endpoints.details.album,
      params: {'albumid': id},
    );
    if (response["list"].isEmpty) {
      throw Exception("No songs found");
    }
    return Album.fromJson(response);
  }

  Future<AlbumWithSongs> getalbumsongs(Album album) async {
    final response = await request(
      call: endpoints.details.album,
      params: {'albumid': album.id},
    );
    if (response["list"].isEmpty) {
      throw Exception("No songs found");
    }
    return AlbumWithSongs.fromJson(response);
  }
}
