import 'package:saavnapi/src/models/Artist.dart';
import 'package:saavnapi/src/client.dart';
import 'package:saavnapi/src/apiends.dart';

class ArtistsEnd extends BaseClient {
  Future<Artists> fetchArtists(String query) async {
    final response = await request(
      call: endpoints.search.artists,
      params: {'q': query.replaceAll(" ", "+")},
    );
    List<Artist> artists = [];
    if (!response["results"].isEmpty) {
      for (var artist in response["results"]) {
        artists.add(await artistById(artist["id"]));
      }
    }
    if (artists.isEmpty) {
      throw Exception("No artists found");
    }
    return Artists(artists: artists);
  }

  Future<Artist> artistById(String id) async {
    final response = await request(
      call: endpoints.details.artist,
      params: {'artistId': id},
    );
    return Artist.fromJson(response);
  }
}
