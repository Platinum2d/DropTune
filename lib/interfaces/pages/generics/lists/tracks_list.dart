import 'package:droptune/interfaces/pages/generics/entries/track_entry.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/misc/queue_generators/shuffled_queue_generator.dart';
import 'package:droptune/misc/routing/routing.dart';
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
      this.showInitialShuffleItem = true});

  @override
  _TracksListState createState() => _TracksListState();
}

class _TracksListState extends State<TracksList> {
  DroptunePlayer player;

  ListTile _buildShuffleItem(context) {
    return ListTile(
      onTap: () {
        QueueGenerator queueGenerator = ShuffledQueueGenerator();
        if (widget.playlist != null) {
          player.reproducingPlaylist = widget.playlist;
          List<Track> separatedTracks = List.from(widget.playlist.tracks);
          player.queueTracks = queueGenerator.createQueue(separatedTracks);
        }

        if (widget.album != null) {
          player.reproducingAlbum = widget.album;
          List<Track> separatedTracks = List.from(widget.album.tracks);
          player.queueTracks = queueGenerator.createQueue(separatedTracks);
        }

        if (widget.author != null) {
          player.reproducingAuthor = widget.author;
          List<Track> separatedTracks = List.from(widget.author.tracks);
          player.queueTracks = queueGenerator.createQueue(separatedTracks);
        }

        player.isShuffling = true;
        player.moveTo(0);
        Routing.goToPlayingPage(context);
      },
      leading: Container(
        padding: EdgeInsets.all(14),
        child: Image.asset("assets/images/shuffle_icon.png"),
      ),
      title: Text("Shuffle"),
    );
  }

  @override
  Widget build(BuildContext generalContext) {
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
          if (index == 0)
            return widget.showInitialShuffleItem
                ? _buildShuffleItem(generalContext)
                : Container();

          TrackEntry entryToReturn = TrackEntry(
            track: widget.tracks[index - 1],
            playlist: widget.playlist,
            album: widget.album,
            author: widget.author,
            removeTrackFromPlaylistCallback: (track) {
              setState(() {
                widget.tracks.remove(track);
                widget.playlist.tracks.remove(track);
              });
            },
          );

          return Padding(
            child: entryToReturn,
            padding: EdgeInsets.only(bottom: 7),
          );
        },
        itemCount: widget.tracks.length + 1,
      );
    else
      return emptyMessage;
  }
}
