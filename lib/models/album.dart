import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Album {
  Album({
    this.id,
    @required this.coverImage,
    @required this.name,
    @required this.author,
    @required this.tracks,
  });

  final int id;
  final AssetImage coverImage;
  final String name;
  final Author author;
  final List<Track> tracks;
}
