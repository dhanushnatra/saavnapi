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
  test("artist with songs", () {
    playlistsEnd
        .getplaylistsongs(
          Playlist(
            id: "89662467",
            title: "money Money Money",
            imageUrl:
                "https://c.saavncdn.com/editorial/logo/MoneyMoneyMoney_89662467_20161108.jpg?bch=1729489870",
          ),
        )
        .then((value) => expect(value, isA<PlaylistWithSongs>()));
  });
}
