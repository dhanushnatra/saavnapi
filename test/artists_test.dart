import 'package:test/test.dart';
import 'package:saavnapi/src/endpoints/Artists.dart';
import 'package:saavnapi/src/models/Artist.dart';

void main() {
  ArtistsEnd artistsEnd = ArtistsEnd();
  test("Artist search", () {
    artistsEnd
        .fetchArtists("Micheal Jackson")
        .then((value) => expect(value, isA<Artists>()));
  });
  test("artist by id", () {
    artistsEnd
        .artistById("513159")
        .then((value) => expect(value, isA<Artist>()));
  });

  test("artist with songs", () {
    artistsEnd
        .getartistsongs(
          Artist(
            id: "513159",
            title: "Micheal jackson",
            imageUrl:
                "https://c.saavncdn.com/artists/Michael_Jackson_150x150.jpg",
          ),
        )
        .then((value) => expect(value, isA<ArtistWithSongs>()));
  });
}
