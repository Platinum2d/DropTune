import 'package:flutter/material.dart';

import 'package:droptune/models/Artist.dart';

class Track {
  Track(
      {this.id,
      @required this.coverImage,
      this.remoteId,
      @required this.name,
      @required this.duration,
      @required this.path,
      @required this.authors});

  final int id;
  final AssetImage coverImage;
  final int remoteId;
  final String name;
  final int duration;
  final String path;
  final List<Artist> authors;
/*final User user;*/
}
