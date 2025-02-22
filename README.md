# SaavnAPI

[![Pub](https://img.shields.io/pub/v/jiosaavn.svg)](https://pub.dev/packages/jiosaavn)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/your-username/jiosaavn/blob/main/LICENSE)

An unofficial Dart package for accessing the JioSaavn API.

## Features

- Search for songs, albums, and artists
- Fetch song details
- Fetch album details
- Fetch artist details
- Fetch playlists

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
    saavnapi: 
        git:
            url: https://github.com/dhanushnatra/saavnapi.git
            ref: main
```

Then run:

```sh
flutter pub get
```

## Usage

```dart
import 'package:saavnapi/saavnapi.dart';

void main() async {
    final api = SaavnAPI();

    // Search for songs
    var searchResults = await api.('song name');
    print(searchResults);

    // Get song details
    var songDetails = await api.getSongDetails('song id');
    print(songDetails);

    // Get album details
    var albumDetails = await api.getAlbumDetails('album id');
    print(albumDetails);

    // Get artist details
    var artistDetails = await api.getArtistDetails('artist id');
    print(artistDetails);

    // Get playlist details
    var playlistDetails = await api.getPlaylistDetails('playlist id');
    print(playlistDetails);
}
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.