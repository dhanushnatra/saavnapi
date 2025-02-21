import 'package:saavnapi/saavnapi.dart';

void main() {
  final client = SaavnApi();

  // Example usage of the client
  client.songs
      .fetchSongs("love")
      .then((songs) {
        for (var song in songs.songs) {
          print("Song: ${song.title}");
        }
      })
      .catchError((error) {
        print("Error fetching songs: $error");
      });

  client.albums
      .fetchAlbums("romantic")
      .then((albums) {
        for (var album in albums.albums) {
          print("Album: ${album.title}");
        }
      })
      .catchError((error) {
        print("Error fetching albums: $error");
      });

  client.playlists
      .fetchPlaylists("party")
      .then((playlists) {
        for (var playlist in playlists.playlists) {
          print("Playlist: ${playlist.title}");
        }
      })
      .catchError((error) {
        print("Error fetching playlists: $error");
      });

  client.artists
      .fetchArtists("arijit")
      .then((artists) {
        for (var artist in artists.artists) {
          print("Artist: ${artist.title}");
        }
      })
      .catchError((error) {
        print("Error fetching artists: $error");
      });
}
