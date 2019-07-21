import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/track_utils.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/track.dart';

class AlbumUtils {
  static final String _defaultAlbumName = "Music";

  static List<Track> _extractAlbumTracks(Album album, List<Track> tracks) {
    List<Track> albumTracks = [];

    for (Track track in tracks) {
      if (track.album.name == album.name) albumTracks.add(track);
    }

    return albumTracks;
  }

  static bool _albumContained(Album album, List<Album> albums){
    for (Album a in albums)
      if (a.name == album.name)
        return true;

    return false;
  }

  static List<Album> getAllAlbums() {
    List<Track> allTracks = TrackUtils.getCachedAllTracks();
    List<Album> albums = [];
    Album currentAlbum;

    for (Track track in allTracks) {
      if (
          track.album.name == _defaultAlbumName ||
          track.album == null ||
          _albumContained(track.album, albums)) continue;

      List<Track> albumTracks = _extractAlbumTracks(track.album, allTracks);
      currentAlbum = Album(id: albumTracks[0].album.id, coverImage: albumTracks[0].coverImage, name: albumTracks[0].album.name, tracks: albumTracks);
      albums.add(currentAlbum);
    }

    albums.sort((Album a, Album b){
      return a.name.compareTo(b.name);
    });

    return albums;
  }

  static List<Album> getCachedAllAlbums(){
    return GetItReference.getIt.get<List<Album>>();
  }
}
