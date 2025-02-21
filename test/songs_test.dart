import 'package:test/test.dart';
import 'package:saavnapi/src/endpoints/Songs.dart';
import 'package:saavnapi/src/models/Song.dart';

void main() {
  SongsEnd songsEnd = SongsEnd();
  test('fetchbyid', () {
    songsEnd
        .fetchSongsById(["BeXBcbVK", "SdZc6-ST"])
        .then((value) => expect(value, isA<Songs>()));
  });
  test("songsearch", () {
    songsEnd
        .fetchSongs("believer")
        .then((value) => expect(value, isA<Songs>()));
  });
  test("trending", () {
    songsEnd
        .trending(language: "telugu")
        .then((value) => expect(value, isA<Songs>()));
  });
  test("get song reco", () {
    songsEnd
        .getrecommended("BeXBcbVK")
        .then((value) => expect(value, isA<Songs>()));
  });
}
