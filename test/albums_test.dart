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
}
