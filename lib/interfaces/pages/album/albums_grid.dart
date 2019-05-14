import 'package:droptune/interfaces/pages/album/album_details.dart';
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
                padding: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AlbumDetailsPage(
                            album: albums[index],
                            index: index,
                          ))),
                  child: Hero(
                      tag: index,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: albums[index].coverImage
                      )),
                ),
              ),
              Text(albums[index].author.name),
            ],
          );
        });
  }
}
