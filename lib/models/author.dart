import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Author implements Comparable<Author>{

  Author({@required this.name, this.tracks});

  final String name;
  List<Track> tracks;

  static Map<String, dynamic> toMap(Author a){
    return {
      "name": a.name,
      "tracks": a.tracks
    };
  }

  static Author fromMap(Map<String, dynamic> a){
    return Author(name: a["author"]);
  }

  @override
  int compareTo(Author other) {
    return this.name.compareTo(other.name);
  }


}