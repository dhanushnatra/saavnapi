import 'package:saavnapi/src/models/Artist.dart';
import 'package:saavnapi/src/client.dart';
import 'package:saavnapi/src/apiends.dart';

class ArtistsEnd extends BaseClient {
  Future<Artists> fetchArtists(String query) async {
    final response = await request(
      call: endpoints.search.artists,
      params: {'q': query.replaceAll(" ", "+")},
    );
    if (response["results"].isEmpty) {
      throw Exception("No artists found");
    }
    return Artists.fromJsonlist(response["results"]);
  }

  Future<Artist> artistById(String id) async {
    final response = await request(
      call: endpoints.details.artist,
      params: {'artistId': id},
    );
    return Artist.fromJson(response);
  }

  Future<ArtistWithSongs> getartistsongs(Artist artist) async {
    final response = await request(
      call: endpoints.details.artist,
      params: {'artistId': artist.id},
    );
    if (response["artistId"].isEmpty) {
      throw Exception("No songs found");
    }
    return ArtistWithSongs.fromJson(response);
  }
}

void main() async {
  final artists = ArtistsEnd();
  final artist = await artists.artistById("513159");
  final songs = await artists.getartistsongs(artist);
  print(artist);
  print(songs.songs.songs[0].title);
}
