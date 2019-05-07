import 'package:droptune/interfaces/pages/widgets/albums_grid.dart';
import 'package:droptune/interfaces/pages/widgets/authors_list.dart';
import 'package:droptune/interfaces/pages/widgets/tracks_list.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  final List<Track> tracks = [
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        name: "Thunderstruck",
        path: "",
        duration: 0,
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
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
  ];

  final List<Author> authors = [
    Author(name: "Michael Jackson", tracks: <Track>[]),
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
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: TracksList(
              tracks: widget.tracks,
              trailingAction: () {},
            ),
          ),
          AlbumsGrid(
            albums: widget.albums,
          ),
          AuthorsList(
            authors: widget.authors,
            trailingAction: () {},
          )
        ]));
  }
}
