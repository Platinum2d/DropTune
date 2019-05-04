import 'package:flutter/material.dart';

import 'package:droptune/models/track.dart';

class Playlist{

  Playlist({this.id, @required this.name, @required this.tracks});

  final int id;
  final String name;
  final List<Track> tracks;
}