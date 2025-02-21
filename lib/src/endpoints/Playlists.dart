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
      List<Playlist> playlists = [];
      if (!response["results"].isEmpty) {
        for (var playlist in response["results"]) {
          playlists.add(await playlistById(playlist["id"]));
        }
      }
      if (playlists.isEmpty) {
        throw Exception("No playlists found");
      }
      return Playlists(playlists: playlists);
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
      List<Playlist> playlists = [];
      if (!response.isEmpty) {
        for (var playlist in response) {
          playlists.add(await playlistById(playlist["id"]));
        }
      }
      if (playlists.isEmpty) {
        throw Exception("No playlists found");
      }
      return Playlists(playlists: playlists);
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
}
