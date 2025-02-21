import 'package:test/test.dart';
import 'package:saavnapi/src/endpoints/Artists.dart';
import 'package:saavnapi/src/models/Artist.dart';

void main() {
  ArtistsEnd artistsEnd = ArtistsEnd();
  test("Artist search", () {
    artistsEnd
        .fetchArtists("arijit singh")
        .then((value) => expect(value, isA<Artists>()));
  });
  test("artist by id", () {
    artistsEnd
        .artistById("459320")
        .then((value) => expect(value, isA<Artist>()));
  });
}
