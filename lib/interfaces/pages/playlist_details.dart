import 'package:droptune/interfaces/pages/widgets/tracks_list.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';

class PlaylistDetailsPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistDetailsPage({@required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 330.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(playlist.name,
                    style: TextStyle(
                      color: innerBoxIsScrolled ? Colors.black : Colors.white,
                      fontSize: 16.0,
                    )),
                background: Hero(
                    tag: playlist.name,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: playlist.coverImage,
                        ),
                      ),
                    ))),
          ),
        ];
      },
      body: TracksList(tracks: playlist.tracks,),
    ));
  }
}
