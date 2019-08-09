import 'package:droptune/misc/utils/track_utils.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/cupertino.dart';

class PlaylistUtils{
  static Playlist getMainPlaylistSignature(){
    return Playlist(
        id: -1,
        tracks: TrackUtils.getCachedAllTracks(),
        name: "All tracks",
        coverImage: AssetImage('assets/images/all_tracks.png'));
  }
}