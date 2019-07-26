import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Playlist {
  Playlist(
      {this.id,
      @required this.coverImage,
      @required this.name,
      @required this.tracks});

  final int id;
  final AssetImage coverImage;
  final String name;
  final List<Track> tracks;

  static Playlist fromMap(Map p) {
    return Playlist(
        id: p["id"],
        name: p["name"],
        coverImage: AssetImage("assets/images/default_song_image.jpg"));
  }
}
