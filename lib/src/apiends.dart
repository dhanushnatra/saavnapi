const endpoints = (
  search: (
    songs: "search.getResults",
    albums: "search.getAlbumResults",
    playlists: "search.getPlaylistResults",
    artists: "search.getArtistResults",
  ),
  details: (
    song: "song.getDetails",
    album: "content.getAlbumDetails",
    playlist: "playlist.getDetails",
    artist: "artist.getArtistMoreSong",
  ),
  trending: "content.getTrending",
  lyrics: "lyrics.getLyrics",
  reco: "reco.getreco",
);
