import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Playlist implements Comparable<Playlist> {
  Playlist(
      {this.id,
      @required this.coverImage,
      @required this.name,
      @required this.tracks});

  final int id;
  final AssetImage coverImage;
  String name;
  List<Track> tracks;

  static Map<String, dynamic> toMap(Playlist p) {
    return {'id': p.id, 'name': p.name};
  }

  static Playlist fromMap(Map p) {
    if (p == null) return null;

    return Playlist(
        id: p["id"],
        name: p["name"],
        coverImage: AssetImage("assets/images/default_song_image.jpg"));
  }

  @override
  int compareTo(Playlist other) {
    return other.id == this.id ? 0 : -1;
  }

  Map<String, dynamic> toJson(){
    return toMap(this);
  }
}
