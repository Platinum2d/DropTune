import 'package:droptune/interfaces/pages/generics/albums_grid.dart';
import 'package:droptune/interfaces/pages/generics/lists/authors_list.dart';
import 'package:droptune/interfaces/pages/generics/lists/tracks_list.dart';
import 'package:droptune/misc/utils/album_utils.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/utils/track_utils.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {

  final List<Album> albums = [
    Album(
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        name: "The Razor's edge",
        tracks: <Track>[
          Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),
        ]),
    Album(
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        name: "The Razor's edge",
        tracks: <Track>[
          Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),
        ]),
    Album(
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        name: "The Razor's edge",
        tracks: <Track>[
          Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),
        ]),
    Album(
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        name: "The Razor's edge",
        tracks: <Track>[
          Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),
        ]),
    Album(
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        name: "The Razor's edge",
        tracks: <Track>[
          Track(
              name: "Thunderstruck",
              path: "",
              duration: Duration(minutes: 3, seconds: 1),
              coverImage: AssetImage('assets/images/default_song_image.jpg'),
              author: Author(name: "AC/DC", tracks: [])),
        ]),
  ];

  final List<Author> authors = [
    Author(name: "Michael Jackson", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),Track(
          name: "Thunderstruck",
          path: "",
          duration: Duration(minutes: 3, seconds: 1),
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          author: Author(name: "AC/DC", tracks: [])),
    ]),
    Author(name: "AC/DC", tracks: <Track>[]),
    Author(name: "Caparezza", tracks: <Track>[]),
  ];

  final List<Tab> tabs = [
    Tab(
      text: "Tracks",
    ),
    Tab(
      text: "Albums",
    ),
    Tab(
      text: "Authors",
    )
  ];

  @override
  State createState() {
    return _MusicPageState();
  }
}

class _MusicPageState extends State<MusicPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(
      length: 3,
      vsync: this,
    );

    return Scaffold(
        appBar: TabBar(
            isScrollable: true,
            controller: controller,
            indicatorColor: Colors.lightBlueAccent,
            tabs: widget.tabs),
        body: TabBarView(controller: controller, children: <Widget>[
          TracksList(
            tracks: TrackUtils.getCachedAllTracks(),
            playlist: Playlist(name: "All tracks"),
          ),
          AlbumsGrid(
            albums: AlbumUtils.getCachedAllAlbums(),
          ),
          AuthorsList(
            authors: widget.authors,
          )
        ]));
  }
}
