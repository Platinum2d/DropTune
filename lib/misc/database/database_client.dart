import 'dart:async';
import 'dart:io';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/track.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Database _db;
  Track track;

  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbpath = join(path.path, "database.db");
    _db = await openDatabase(dbpath, version: 1, onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute("""
    CREATE TABLE tracks(id NUMBER, remoteId NUMBER, name TEXT, duration NUMBER, coverImage TEXT, album TEXT, path TEXT, author TEXT, albumId NUMBER)
    """);
  }

  Future<int> insertTrack(Track track) async {
    int id = 0;
    var count = Sqflite.firstIntValue(await _db
        .rawQuery("SELECT COUNT(*) FROM tracks WHERE id = ?", [track.id]));
    if (count == 0) {
      id = await _db.insert("tracks", Track.toMap(track));
    } else {
      await _db.update("tracks", Track.toMap(track),
          where: "id= ?", whereArgs: [track.id]);
    }
    return id;
  }

  Future<bool> alreadyLoaded() async {
    var count = Sqflite.firstIntValue(
        await _db.rawQuery("SELECT COUNT(*) FROM tracks"));
    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Track>> fetchTracks() async {
    List<Map> results =
        await _db.query("tracks", columns: Track.columns, orderBy: "name");
    List<Track> tracks = new List();
    results.forEach((t) {
      Track track = Track.fromMap(t);
      tracks.add(track);
    });
    return tracks;
  }

  Future<List<Track>> fetchTracksFromAlbum(int id) async {
    List<Map> results =
        await _db.rawQuery("select * from tracks where albumId = $id");
    List<Track> tracks = new List();
    results.forEach((s) {
      Track track = Track.fromMap(s);
      tracks.add(track);
    });
    return tracks;
  }

  Future<List<Album>> fetchAlbums() async {
    List<Map> results = await _db.rawQuery(
        "select distinct * from tracks group by album order by album");
    List<Album> albums = new List();
    results.forEach((t) async {
      Track track = Track.fromMap(t);
      Album album = track.album;
      albums.add(album);
    });
    return albums;
  }

  Future<List<Track>> fetchArtist() async {
    List<Map> results = await _db.rawQuery(
        "select distinct artist, album, coverImage from tracks group by artist order by artist");
    List<Track> tracks = new List();
    results.forEach((s) {
      Track track = Track.fromMap(s);
      tracks.add(track);
    });
    return tracks;
  }

  Future<List<Track>> fetchTrackByArtist(String artist) async {
    List<Map> results = await _db.query("tracks",
        columns: Track.columns, where: "artist='$artist'");
    List<Track> tracks = new List();
    results.forEach((s) {
      Track track = Track.fromMap(s);
      tracks.add(track);
    });
    return tracks;
  }

  Future<int> updateTrack(Track track) async {
    int id = 0;
    // id==9999 for shared track
    await _db
        .update("tracks", Track.toMap(track), where: "id= ?", whereArgs: [track.id]);

    return id;
  }

  Future<List<Track>> searchTrack(String q) async {
    List<Map> results =
        await _db.rawQuery("select * from songs where title like '%$q%'");
    List<Track> tracks = new List();
    results.forEach((s) {
      Track track = Track.fromMap(s);
      tracks.add(track);
    });
    return tracks;
  }

  Future<List<Track>> fetchTracksById(int id) async {
    List<Map> results = await _db.rawQuery("select * from songs where id=$id");
    List<Track> tracks = new List();
    results.forEach((s) {
      Track track = Track.fromMap(s);
      tracks.add(track);
    });
    return tracks;
  }
}
