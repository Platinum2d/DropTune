import 'package:droptune/interfaces/pages/playing_page.dart';
import 'package:droptune/interfaces/pages/generics/track_options.dart';
import 'package:droptune/misc/utils/droptune_utils.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

import 'package:droptune/models/track.dart';

class TrackEntry extends StatelessWidget {
  final Track track;
  final Playlist playlist;
  final Function removeTrackFromPlaylistCallback;

  TrackEntry(
      {@required this.track,
      this.playlist,
      this.removeTrackFromPlaylistCallback});

  Future _buildTrackOptions(BuildContext context) {
    return showRoundedModalBottomSheet(
        context: context,
        radius: 20,
        builder: (context) {
          return TrackOptions(
            track: track,
            playlist: playlist,
          );
        }).then((map) {
      if (map != null) {
        if (map["removedFromPlaylist"]) removeTrackFromPlaylistCallback(track);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Routing.goToPlayingPage(context, track, playlist,
                  clearStack: false);
            },
            leading: CircleAvatar(
              backgroundImage: track.coverImage,
              radius: 25,
            ),
            title: Text(
              track.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              track.author.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.only(right: 1, top: 10, bottom: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Image(
                        height: 20,
                        width: 20,
                        image: AssetImage("assets/images/desync_icon.png")),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      _buildTrackOptions(context);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
