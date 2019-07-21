import 'package:droptune/interfaces/pages/generics/lists/tracks_list.dart';
import 'package:droptune/models/album.dart';
import 'package:flutter/material.dart';

class AlbumDetailsPage extends StatelessWidget {
  final Album album;
  final int index;

  AlbumDetailsPage({@required this.album, @required this.index});

  @override
  Widget build(BuildContext context) {

    String nameToShow = album.name.length > 30 ? album.name.substring(0, 30) : album.name;
    if (nameToShow != album.name)
      nameToShow = nameToShow.replaceRange(nameToShow.length - 3, nameToShow.length, "...");

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(
                color: innerBoxIsScrolled ? Colors.black : Colors.grey),
            expandedHeight: 330.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(nameToShow,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: innerBoxIsScrolled ? Colors.black : Colors.grey,
                      fontSize: 16.0,
                    )),
                background: Hero(
                    tag: index,
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
      body: TracksList(
        tracks: album.tracks,
      ),
    ));
  }
}
