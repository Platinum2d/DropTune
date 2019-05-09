import 'package:droptune/interfaces/pages/widgets/tracks_list.dart';
import 'package:droptune/models/album.dart';
import 'package:flutter/material.dart';

class AlbumDetails extends StatelessWidget{
  final Album album;

  AlbumDetails({@required this.album});

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
                    title: Text(album.name,
                        style: TextStyle(
                          color: innerBoxIsScrolled ? Colors.black : Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Hero(
                        tag: album.name,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: album.coverImage,
                            ),
                          ),
                        ))),
              ),
            ];
          },
          body: TracksList(tracks: album.tracks, trailingAction: () {},),
        ));
  }
}