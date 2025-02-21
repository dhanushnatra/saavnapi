import 'package:test/test.dart';
import 'package:saavnapi/src/endpoints/Playlists.dart';
import 'package:saavnapi/src/models/Playlist.dart';

void main() {
  PlaylistsEnd playlistsEnd = PlaylistsEnd();
  test("Artist search", () {
    playlistsEnd
        .fetchPlaylists("arijit singh")
        .then((value) => expect(value, isA<Playlists>()));
  });
  test("artist by id", () {
    playlistsEnd
        .playlistById("802336660")
        .then((value) => expect(value, isA<Playlist>()));
  });
  test("trending playlist", () {
    playlistsEnd.trending().then((value) => expect(value, isA<Playlists>()));
  });
}
