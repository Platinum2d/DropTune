import 'package:droptune/misc/song_track_adapter/song_track_adapter.dart';
import 'package:droptune/models/track.dart';
import 'package:flute_music_player/flute_music_player.dart';

class MusicUtils {
  static Future<List<Track>> getAllTracks() async {
    List<Track> tracks = [];
    SongTrackAdapter adapter = SongTrackAdapter(null);
    await MusicFinder.allSongs().then((allSongs) {
      List<Song> songs = allSongs;
      for (Song s in songs) {
        adapter.song = s;
        Track t = Track(
            coverImage: adapter.getCoverImage(),
            name: adapter.getName(),
            duration: adapter.getDuration(),
            path: adapter.getPath(),
            author: adapter.getAuthor());
        tracks.add(t);
      }
    });

    tracks.sort((Track a, Track b){
      return a.name.compareTo(b.name);
    });

    return tracks;
  }
}
