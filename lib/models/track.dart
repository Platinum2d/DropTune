import 'package:droptune/models/album.dart';
import 'package:flutter/material.dart';

import 'package:droptune/models/author.dart';

class Track {
  static List<String> columns = [
    "id",
    "remoteId",
    "name",
    "duration",
    "coverImage",
    "album",
    "path",
    "author",
    "albumId"
  ];

  Track(
      {this.id,
      @required this.coverImage,
      this.remoteId,
      @required this.name,
      @required this.duration,
      @required this.path,
      @required this.author,
      @required this.album});

  final int id;
  final AssetImage coverImage;
  final int remoteId;
  final String name;
  final Duration duration;
  final String path;
  final Author author;
  final Album album;

  static Map<String, dynamic> toMap(Track t) {
    return {
      'id': t.id,
      'coverImage': t.coverImage.assetName,
      'remoteId': t.remoteId,
      'name': t.name,
      'duration': t.duration.inMilliseconds,
      'path': t.path,
      'author': t.author.name,
      'album': t.album.name,
      'albumId': t.album.id
    };
  }

  static Track fromMap(Map<String, dynamic> t) {
    return Track(
      id: t["id"],
      coverImage: AssetImage(t["coverImage"]),
      remoteId: t["remoteId"],
      name: t["name"],
      duration: Duration(milliseconds: t["duration"]),
      path: t["path"],
      author: Author(name: t["author"]),
      album: Album(name: t["album"], id: t["id"]),
    );
  }
/*final User user;*/
}
