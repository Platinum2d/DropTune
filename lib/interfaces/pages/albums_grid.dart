import 'package:droptune/interfaces/pages/album_details.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:flutter/material.dart';

class AlbumsGrid extends StatelessWidget {
  final List<Album> albums;

  AlbumsGrid({@required this.albums});

  String _buildAuthorsLabel(Album album) {
    String authors = "";

    List<Author> distinctAuthors = [];

    album.tracks.forEach((track) {
      track.authors.forEach((author) {
        if (!distinctAuthors.contains(author)) {
          distinctAuthors.add(author);
        }
      });
    });

    distinctAuthors.forEach((author) {
      authors += author.name + ", ";
    });

    return authors.length > 0 ? authors.substring(0, authors.length - 2) : "";
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
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AlbumDetailsPage(
                              album: albums[index],
                              index: index,
                            ))),
                    child: Hero(
                      tag: index,
                      child: Image(
                        image: albums[index].coverImage,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ),
              Text(_buildAuthorsLabel(albums[index])),
            ],
          );
        });
  }
}
