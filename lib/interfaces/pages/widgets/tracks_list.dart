import 'package:droptune/interfaces/pages/widgets/track_entry.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class TracksList extends StatelessWidget {
  final List<Track> tracks;
  final Function trailingAction;

  TracksList({@required this.tracks, @required this.trailingAction});

  @override
  Widget build(BuildContext context) {
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

    if (tracks.length > 0)
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            child: TrackEntry(
              track: tracks[index],
              trailingAction: trailingAction,
            ),
            padding: EdgeInsets.only(bottom: 7),
          );
        },
        itemCount: tracks.length,
      );
    else
      return emptyMessage;
  }
}
