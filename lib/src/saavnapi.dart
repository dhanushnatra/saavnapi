import 'package:saavnapi/src/endpoints/Albums.dart';
import 'package:saavnapi/src/endpoints/Artists.dart';
import 'package:saavnapi/src/endpoints/Playlists.dart';
import 'package:saavnapi/src/endpoints/Songs.dart';

class SaavnApi {
  final AlbumsEnd albums;
  final ArtistsEnd artists;
  final PlaylistsEnd playlists;
  final SongsEnd songs;
  SaavnApi()
    : albums = AlbumsEnd(),
      artists = ArtistsEnd(),
      playlists = PlaylistsEnd(),
      songs = SongsEnd();
}
