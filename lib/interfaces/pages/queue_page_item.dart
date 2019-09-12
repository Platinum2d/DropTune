import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueuePageItem extends StatefulWidget {
  final Track track;

  QueuePageItem({this.track});

  @override
  _QueuePageItemState createState() => _QueuePageItemState();
}

class _QueuePageItemState extends State<QueuePageItem> {
  @override
  Widget build(BuildContext context) {
    ListTile tile = ListTile(
      key: Key(widget.track.id.toString()),
      leading: CircleAvatar(
        backgroundImage: widget.track.coverImage,
        radius: 25,
      ),
      title: Text(
        widget.track.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        widget.track.author.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.reorder),
    );

    return widget.track.compareTo(
                Provider.of<DroptunePlayer>(context).getCurrentTrack()) !=
            0
        ? tile
        : Container(
            color: Colors.cyan,
            child: tile,
          );
  }
}
