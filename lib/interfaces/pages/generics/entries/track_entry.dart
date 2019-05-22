import 'package:droptune/interfaces/pages/playing_page.dart';
import 'package:droptune/interfaces/pages/generics/track_options.dart';
import 'package:droptune/misc/droptune_utils.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

import 'package:droptune/models/track.dart';

class TrackEntry extends StatelessWidget {
  final Track track;
  final Playlist playlist;

  TrackEntry({@required this.track, this.playlist});

  Future _buildTrackOptions(BuildContext context) {
    return showRoundedModalBottomSheet(
        context: context,
        radius: 20,
        builder: (context) {
          return TrackOptions(
            track: track,
            playlist: playlist,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String authors = DroptuneUtils.buildAuthorsLabel(track);

    return GestureDetector(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlayingPage(
                        track,
                        playlist: playlist,
                      )));
            },
            leading: CircleAvatar(
              backgroundImage: track.coverImage,
              radius: 25,
            ),
            title: Text(track.name),
            subtitle: Text(authors),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.only(right: 3, top: 10, bottom: 10),
                  child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Image(
                      height: 30,
                      width: 30,
                      image: AssetImage("assets/images/desync_icon.png")),
                ),),
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
