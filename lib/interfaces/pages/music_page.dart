import 'package:droptune/interfaces/pages/widgets/albums_grid.dart';
import 'package:droptune/interfaces/pages/widgets/authors_list.dart';
import 'package:droptune/interfaces/pages/widgets/tracks_list.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  final List<Track> tracks = [
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])])
  ];

  final List<Album> albums = [
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Album(name: "The Razor's edge", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
  ];

  final List<Author> authors = [
    Author(name: "AC/DC", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ]),
    Author(name: "Michael Jackson", tracks: <Track>[
      Track(
          name: "Thunderstruck",
          path: "",
          duration: 0,
          coverImage: AssetImage('assets/images/default_song_image.jpg'),
          authors: <Author>[Author(name: "AC/DC", tracks: [])])
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            appBar:
                TabBar(indicatorColor: Colors.lightBlueAccent, tabs: <Widget>[
              Tab(
                text: "Tracks",
              ),
              Tab(
                text: "Albums",
              ),
              Tab(
                text: "Authors",
              )
            ]),
            body: TabBarView(children: <Widget>[
              TracksList(
                tracks: tracks,
                trailingAction: () {},
              ),
              AlbumsGrid(
                albums: albums,
              ),
              AuthorsList(
                authors: authors,
                trailingAction: () {},
              )
            ])));
  }
}
