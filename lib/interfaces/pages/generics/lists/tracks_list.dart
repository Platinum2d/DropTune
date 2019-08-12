import 'package:droptune/interfaces/pages/generics/entries/track_entry.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/misc/queue_generators/shuffled_queue_generator.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class TracksList extends StatefulWidget {
  final List<Track> tracks;
  final Playlist playlist;
  final Album album;
  final Author author;

  final bool showInitialShuffleItem;

  TracksList(
      {@required this.tracks,
      this.playlist,
      this.author,
      this.album,
      this.showInitialShuffleItem = false});

  @override
  _TracksListState createState() => _TracksListState();
}

class _TracksListState extends State<TracksList> {
  DroptunePlayer player;

  ListTile _buildShuffleItem() {
    return ListTile(
      onTap: (){
        QueueGenerator queueGenerator = ShuffledQueueGenerator();
        if (widget.playlist != null){
          player.reproducingPlaylist = widget.playlist;
          player.queueTracks = queueGenerator.createQueue(widget.playlist.tracks);
        }

        if (widget.album != null){
          player.reproducingAlbum = widget.album;
          player.queueTracks = queueGenerator.createQueue(widget.album.tracks);
        }

        if (widget.author != null){
          player.reproducingAuthor = widget.author;
          player.queueTracks = queueGenerator.createQueue(widget.author.tracks);
        }

        player.moveTo(0);
      },
      leading: Container(
        padding: EdgeInsets.all(14),
        child: Image.asset("assets/images/shuffle_icon.png"),
      ),
      title: Text("Shuffle"),
    );
  }

  @override
  Widget build(BuildContext context) {
    player = GetItReference.getIt.get<DroptunePlayer>();

    Widget emptyMessage = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.archive,
            size: 50,
            color: Colors.grey,
          ),
          Text("No music here!")
        ],
      ),
    );

    if (widget.tracks.length > 0)
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            child: index > 0
                ? TrackEntry(
                    track: widget.tracks[index],
                    playlist: widget.playlist,
                    album: widget.album,
                    author: widget.author,
                    removeTrackFromPlaylistCallback: (track) {
                      setState(() {
                        widget.tracks.remove(track);
                        widget.playlist.tracks.remove(track);
                      });
                    },
                  )
                : widget.showInitialShuffleItem
                    ? _buildShuffleItem()
                    : Container(),
            padding: EdgeInsets.only(bottom: 7),
          );
        },
        itemCount: widget.tracks.length,
      );
    else
      return emptyMessage;
  }
}
