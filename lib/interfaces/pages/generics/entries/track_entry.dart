import 'package:droptune/interfaces/pages/playing_page/playing_page.dart';
import 'package:droptune/interfaces/pages/generics/track_options.dart';
import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/misc/queue_generators/sorted_queue_generator.dart';
import 'package:droptune/misc/utils/droptune_utils.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

import 'package:droptune/models/track.dart';

class TrackEntry extends StatelessWidget {
  final Track track;
  final Playlist playlist;
  final Album album;
  final Author author;

  final Function removeTrackFromPlaylistCallback;

  final DroptunePlayer _player = GetItReference.getIt.get<DroptunePlayer>();

  TrackEntry(
      {@required this.track,
      this.playlist,
      this.album,
      this.author,
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
              QueueGenerator queueGenerator =
                  SortedQueueGenerator(sortingKey: (a, b) {
                return a.compareTo(b);
              });

              if (playlist != null &&
                  (_player.reproducingPlaylist == null ||
                      _player.reproducingPlaylist.compareTo(playlist) != 0)) {
                _player.queueTracks =
                    queueGenerator.createQueue(playlist.tracks);
                _player.reproducingPlaylist = playlist;
              }

              if (album != null &&
                  (_player.reproducingAlbum == null ||
                      _player.reproducingAlbum.compareTo(album) != 0)) {
                _player.queueTracks = queueGenerator.createQueue(album.tracks);
                _player.reproducingAlbum = album;
              }

              if (author != null &&
                  (_player.reproducingAuthor == null ||
                      _player.reproducingAuthor.compareTo(author) != 0)) {
                _player.queueTracks = queueGenerator.createQueue(author.tracks);
                _player.reproducingAuthor = author;
              }

              _player.moveToTrack(track);

              Routing.goToPlayingPage(
                context,
              );
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
