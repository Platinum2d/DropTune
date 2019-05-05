import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

class AlbumsGrid extends StatelessWidget {
  final List<Album> albums;

  AlbumsGrid({@required this.albums});

  String _buildAuthorsLabel(Album album){
    String authors = "";

    List<Author> distinctAuthors = [];

    album.tracks.forEach((track) {
      track.authors.forEach((author) {
        if (!distinctAuthors.contains(author)){
          distinctAuthors.add(author);
        }
      });
    });

    distinctAuthors.forEach((author){
      authors += author.name + ", ";
    });

    return authors.substring(0, authors.length - 2);
  }

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
                child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/default_song_image.jpg',
                  height: 100,
                  width: 100,
                ),
              ),),
              Text(albums[index].name),
              Text(_buildAuthorsLabel(albums[index]))
            ],
          );
        });
  }
}
