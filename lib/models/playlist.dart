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
  String name;
  List<Track> tracks;

  static Map<String, dynamic> toMap(Playlist p){
    return {
      'id': p.id,
      'name': p.name
    };
  }

  static Playlist fromMap(Map p) {
    return Playlist(
        id: p["id"],
        name: p["name"],
        coverImage: AssetImage("assets/images/default_song_image.jpg"));
  }
}
