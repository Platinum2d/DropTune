import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Album {
  Album({
    this.id,
    @required this.coverImage,
    @required this.name,
    this.tracks,
  });

  final int id;
  final AssetImage coverImage;
  final String name;
  List<Track> tracks;

  static Map<String, dynamic> toMap(Album a) {
    return {
      "id": a.id,
      "coverImage": a.coverImage.assetName,
      "name": a.name,
      "tracks": a.tracks
    };
  }

  static Album fromMap(Map<String, dynamic> a) {
    if (a == null) return null;

    Album toReturn = Album(
        id: a["id"],
        coverImage: AssetImage(a["coverImage"]),
        name: a["name"],
        tracks: []);

    List<dynamic> mappedTracks = a["tracks"];
    if (mappedTracks != null && mappedTracks.length > 0) {
      for (var t in mappedTracks) toReturn.tracks.add(Track.fromMap(t));
    }
    return toReturn;
  }

  Map<String, dynamic> toJson() {
    return toMap(this);
  }
}
