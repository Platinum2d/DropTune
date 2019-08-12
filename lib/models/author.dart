import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Author implements Comparable<Author> {
  Author({@required this.name, this.tracks});

  final String name;
  List<Track> tracks;

  static Map<String, dynamic> toMap(Author a) {
    return {"author": a.name, "tracks": a.tracks};
  }

  static Author fromMap(Map<String, dynamic> a) {
    if (a == null) return null;

    Author toReturn = Author(name: a["author"], tracks: []);

    List<dynamic> mappedTracks = a["tracks"];
    if (mappedTracks != null && mappedTracks.length > 0) {
      for (var t in mappedTracks) toReturn.tracks.add(Track.fromMap(t));
    }
    return toReturn;
  }

  Map<String, dynamic> toJson() {
    return toMap(this);
  }

  @override
  int compareTo(Author other) {
    return this.name.compareTo(other.name);
  }
}
