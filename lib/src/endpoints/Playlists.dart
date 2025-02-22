import 'package:saavnapi/src/models/Playlist.dart';
import 'package:saavnapi/src/client.dart';
import 'package:saavnapi/src/apiends.dart';

class PlaylistsEnd extends BaseClient {
  Future<Playlists> fetchPlaylists(
    String query, {
    String n = "20",
    String p = "1",
  }) async {
    try {
      final response = await request(
        call: endpoints.search.playlists,
        params: {'q': query.replaceAll(" ", "+"), 'n': n, 'p': p},
      );
      if (response["results"].isEmpty) {
        throw Exception("No playlists found");
      }
      return Playlists.fromJsonlist(response["results"]);
    } catch (e) {
      throw Exception("No playlists found");
    }
  }

  Future<Playlists> trending({String language = "english"}) async {
    try {
      final response = await requestlist(
        call: endpoints.trending,
        language: language,
        params: {'entity_type': "playlist"},
      );
      if (response.isEmpty) {
        throw Exception("No playlists found");
      }
      return Playlists.fromJsonlist(response);
    } catch (e) {
      throw Exception("No playlists found");
    }
  }

  Future<Playlist> playlistById(String id) async {
    try {
      final response = await request(
        call: endpoints.details.playlist,
        params: {'listid': id},
      );
      if (response["list"].isEmpty) {
        throw Exception("No songs found");
      }
      return Playlist.fromJson(response);
    } catch (e) {
      throw Exception("No songs found");
    }
  }

  Future<PlaylistWithSongs> getplaylistsongs(Playlist playlist) async {
    try {
      final response = await request(
        call: endpoints.details.playlist,
        params: {'listid': playlist.id},
      );
      if (response["list"].isEmpty) {
        throw Exception("No songs found");
      }
      return PlaylistWithSongs.fromJson(response);
    } catch (e) {
      throw Exception("No songs found");
    }
  }
}
