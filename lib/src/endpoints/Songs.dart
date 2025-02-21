import 'package:saavnapi/src/client.dart';
import 'package:saavnapi/src/models/Song.dart';
import 'package:saavnapi/src/apiends.dart';

class SongsEnd extends BaseClient {
  Future<Songs> fetchSongs(
    String query, {
    String n = "10",
    String p = "1",
  }) async {
    final response = await request(
      call: endpoints.search.songs,
      params: {'q': query.replaceAll(" ", "+"), 'n': n, 'p': p},
    );
    return Songs.fromJsonlist(response["results"]);
  }

  Future<Songs> trending({String language = "english"}) async {
    final response = await requestlist(
      call: endpoints.trending,
      language: language,
      params: {'entity_type': "song"},
    );
    return Songs.fromJsonlist(response);
  }

  Future<Songs> getrecommended(String id) async {
    final response = await requestlist(
      call: endpoints.reco,
      params: {'pid': id},
    );
    return Songs.fromJsonlist(response);
  }

  Future<Songs> fetchSongsById(List<String> ids) async {
    final response = await request(
      call: endpoints.details.song,
      params: {'pids': ids.join(",")},
    );
    return Songs.fromJsonlist(response["songs"]);
  }
}
