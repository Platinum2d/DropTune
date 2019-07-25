import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/song_track_adapter/song_track_adapter.dart';
import 'package:droptune/models/track.dart';
import 'package:flute_music_player/flute_music_player.dart';

class TrackUtils {
  static List<Track> getCachedAllTracks(){
    return GetItReference.getIt.get<List<Track>>();
  }
}
