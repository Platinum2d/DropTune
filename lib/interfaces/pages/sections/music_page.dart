import 'package:droptune/interfaces/pages/generics/albums_grid.dart';
import 'package:droptune/interfaces/pages/generics/lists/authors_list.dart';
import 'package:droptune/interfaces/pages/generics/lists/tracks_list.dart';
import 'package:droptune/misc/utils/album_utils.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/utils/author_utils.dart';
import 'package:droptune/misc/utils/track_utils.dart';
import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
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
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            appBar: TabBar(
                isScrollable: true,
                indicatorColor: Colors.lightBlueAccent,
                tabs: widget.tabs),
            body: TabBarView(children: <Widget>[
              TracksList(tracks: TrackUtils.getCachedAllTracks()),
              AlbumsGrid(
                albums: AlbumUtils.getCachedAllAlbums(),
              ),
              AuthorsList(
                authors: AuthorUtils.getAllCachedAuthors(),
              )
            ])));
  }
}
