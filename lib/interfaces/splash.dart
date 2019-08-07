import 'package:audioplayers/audioplayers.dart';
import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/song_track_adapter/song_track_adapter.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/track.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<String>(
      builder: (context, string, value) {
        return Scaffold(
            body: Container(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/droptune_logo.png',
                height: 125,
                width: 125,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FutureBuilder(
                  future: load(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text("Setting up, please wait...");
                    else
                      return Text("Done");
                  },
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  Future<void> _registerTracks(DatabaseClient db) async {
    var songs;
    songs = await MusicFinder.allSongs();
    List<Song> list = new List.from(songs);
    if (list == null || list.length == 0) {
      Navigator.of(context).pop(true);
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
        return Center(
          child: Text("No music found"),
        );
      }));
    } else {
      SongTrackAdapter adapter = SongTrackAdapter(null);

      List<Track> cached = [];
      for (Song song in list) {
        adapter.song = song;
        Track t = adapter.toTrack();
        await db.insertTrack(t);
        cached.add(t);
      }
      cached.sort((Track a, Track b) {
        return a.name.compareTo(b.name);
      });
      GetItReference.getIt.registerSingleton<List<Track>>(cached);
    }
  }

  Future<void> _loadAlbums(DatabaseClient db) async {
    List<Album> albums = await db.fetchAlbums();
    for (Album album in albums)
      album.tracks = await db.fetchTracksFromAlbum(album.id);
    GetItReference.getIt.registerSingleton<List<Album>>(albums);
  }

  Future<void> _loadAuthors(DatabaseClient db) async {
    List<Author> authors = await db.fetchAuthors();

    for (Author a in authors) a.tracks = await db.fetchTracksByAuthor(a.name);

    GetItReference.getIt.registerSingleton<List<Author>>(authors);
  }

  Future<void> _loadTracks(DatabaseClient db) async {
    GetItReference.getIt.registerSingleton<List<Track>>(await db.fetchTracks());
  }

  Future<void> _registerNewTracks(DatabaseClient db) async {
    List<Song> allSongs = await MusicFinder.allSongs();
    List<Track> registeredTracks = await db.fetchTracks();
    List<String> registeredTracksPaths = [];
    List<String> allTracksPaths = [];
    SongTrackAdapter adapter = SongTrackAdapter(null);

    for (Track t in registeredTracks) registeredTracksPaths.add(t.path);
    for (Song s in allSongs) allTracksPaths.add(s.uri);

    allSongs.forEach((Song s){
      adapter.song = s;
      if (!registeredTracksPaths.contains(adapter.getPath()))
        db.insertTrack(adapter.toTrack());
    });

    registeredTracks.forEach((Track t){
      if (!allTracksPaths.contains(t.path))
        db.deleteTrack(t);
    });
  }

  Future<void> load(BuildContext context) async {
    var db = DatabaseClient();
    await db.create();

    if (await db.alreadyLoaded()) {
      await _registerNewTracks(db);
      _loadTracks(db);
      _loadAlbums(db);
      _loadAuthors(db);
      GetItReference.getIt.registerSingleton<DatabaseClient>(db);
      Routing.goToAccessHub(context, clearStack: true);
    } else {
      await _registerTracks(db);
      _loadAlbums(db);
      _loadAuthors(db);
      GetItReference.getIt.registerSingleton<DatabaseClient>(db);
      Routing.goToAccessHub(context, clearStack: true);
    }
  }
}
