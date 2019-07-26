import 'package:droptune/interfaces/pages/generics/playlist_edit.dart';
import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/misc/utils/track_utils.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

class PlaylistPage extends StatefulWidget {
  @override
  State createState() {
    return _PlaylistPageState();
  }
}

class _PlaylistPageState extends State<PlaylistPage> {
  final Playlist mainPlaylist = Playlist(
      id: -1,
      tracks: TrackUtils.getCachedAllTracks(),
      name: "All tracks",
      coverImage: AssetImage('assets/images/all_tracks.png'));

  List<Playlist> playlists = [];

  @override
  void initState() {
    super.initState();
    GetItReference.getIt
        .get<DatabaseClient>()
        .fetchPlaylists()
        .then((allPlaylists) {
      setState(() {
        playlists = allPlaylists;
      });
    });
  }

  Image _buildImage() {
    return Image.asset(
      'assets/images/default_song_image.jpg',
      height: 120,
      width: 120,
    );
  }

  Text _buildUnderText(int index) {
    return Text(playlists[index].name);
  }

  Widget _buildGridElement(Image image, Text underText, BuildContext context,
      [Playlist playlist]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GestureDetector(
              onLongPress: () {
                showRoundedModalBottomSheet(
                    context: context,
                    radius: 20,
                    builder: (context) {
                      return PlaylistEditPage(
                        playlist: playlist,
                      );
                    });
              },
              onTap: () => Routing.goToPlaylistDetails(context, playlist,
                  clearStack: false),
              child: Hero(
                tag: playlist.id,
                child: image,
              ),
            ),
          ),
        ),
        underText,
      ],
    );
  }

  Widget _buildEmptyElement() {
    return Padding(
        padding: EdgeInsets.only(right: 0),
        child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300])))));
  }

  Widget _buildAllTracksElement(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 0),
        child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () => Routing.goToPlaylistDetails(
                          context, mainPlaylist,
                          clearStack: false),
                      child: Hero(
                        tag: mainPlaylist.id,
                        child: Image.asset(
                          'assets/images/all_tracks.png',
                          height: 135,
                          width: 135,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "All tracks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )));
  }

  Widget _buildAddPlaylistElement(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          child: FlatButton(
              onPressed: () {
                showRoundedModalBottomSheet(
                    context: context,
                    radius: 20,
                    builder: (context) {
                      return PlaylistEditPage(
                        playlist: null,
                      );
                    });
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/add_playlist_button.png",
                    height: 80,
                    width: 80,
                  ),
                  Text(
                    "Add a playlist",
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )),
          padding: EdgeInsets.only(bottom: 10),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final int addingItems = 3;
    final int lastIndex = playlists.length + addingItems - 1;

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return _buildAllTracksElement(context);
        if (index == 1) return _buildEmptyElement();
        if (index == lastIndex) return _buildAddPlaylistElement(context);

        int currentIndex = index - (addingItems - 1);

        Image image = _buildImage();
        Text underText = _buildUnderText(currentIndex);

        return _buildGridElement(
            image, underText, context, playlists[currentIndex]);
      },
      itemCount: playlists.length + addingItems,
    );
  }
}
