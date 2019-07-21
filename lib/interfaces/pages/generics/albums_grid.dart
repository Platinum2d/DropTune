import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/album.dart';
import 'package:flutter/material.dart';

class AlbumsGrid extends StatelessWidget {
  final List<Album> albums;

  AlbumsGrid({@required this.albums});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: albums.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: GestureDetector(
                  onTap: () => Routing.goToAlbumDetails(
                      context, albums[index], index,
                      clearStack: false),
                  child: Hero(
                      tag: index,
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: albums[index].coverImage)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  albums[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(),
                ),
              ),
            ],
          );
        });
  }
}
