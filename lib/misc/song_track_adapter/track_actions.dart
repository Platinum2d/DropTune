import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

abstract class TrackActions {
  int getId();
  AssetImage getCoverImage();
  int getRemoteId();
  String getName();
  Duration getDuration();
  String getPath();
}