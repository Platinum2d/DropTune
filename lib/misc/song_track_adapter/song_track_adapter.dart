import 'package:droptune/misc/song_track_adapter/track_actions.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class SongTrackAdapter implements TrackActions{
  Song song;

  SongTrackAdapter(this.song);

  @override
  int getId() {
    return song.id;
  }

  @override
  AssetImage getCoverImage() {
    return song.albumArt != null ? AssetImage(song.albumArt) : null;
  }

  @override
  int getRemoteId() {
    return -1;
  }

  @override
  String getName() {
    return song.title;
  }

  @override
  Duration getDuration() {
    return Duration(milliseconds: song.duration);
  }

  @override
  String getPath() {
    return song.uri;
  }

}