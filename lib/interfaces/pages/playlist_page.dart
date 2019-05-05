import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  final List<Playlist> playlists = [
    Playlist(name: "Michael Jackson", tracks: []),
    Playlist(name: "AC/DC", tracks: []),
    Playlist(name: "Caparezza", tracks: []),
    Playlist(name: "Festa da Gianvy", tracks: []),
    Playlist(name: "Relax", tracks: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
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
                  child: Image.asset(
                    'assets/images/default_song_image.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Text(playlists[index].name),
            ],
          );
        },
        itemCount: playlists.length,
      ),
    );
  }
}
