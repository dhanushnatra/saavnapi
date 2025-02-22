import 'package:test/test.dart';
import 'package:saavnapi/src/endpoints/Albums.dart';
import 'package:saavnapi/src/models/Album.dart';

void main() {
  AlbumsEnd albumsEnd = AlbumsEnd();
  test("Albumsearch", () {
    albumsEnd
        .fetchAlbums("believer")
        .then((value) => expect(value, isA<Albums>()));
  });
  test("album by id", () {
    albumsEnd
        .albumById("14799536")
        .then((value) => expect(value, isA<Album>()));
  });
  test("trending albums", () {
    albumsEnd
        .trending(language: "telugu")
        .then((value) => expect(value, isA<Albums>()));
  });
  test("albums with songs", () {
    albumsEnd
        .getalbumsongs(
          Album(
            id: "14799536",
            title: "believer",
            imageUrl:
                "https://c.saavncdn.com/128/Believer-English-2018-20190107213710-150x150.jpg",
          ),
        )
        .then((value) => expect(value, isA<AlbumWithSongs>()));
  });
}
