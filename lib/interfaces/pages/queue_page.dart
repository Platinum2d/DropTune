import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class QueuePage extends StatefulWidget {
  final List<Track> queue;

  QueuePage(this.queue);

  @override
  State createState() {
    return _QueuePageState();
  }
}

class _QueuePageState extends State<QueuePage> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      /*final Track item = widget.queue.removeAt(oldIndex);
      widget.queue.insert(newIndex, item);*/
      GetItReference.getIt.get<DroptunePlayer>().moveTrack(oldIndex, newIndex);
    });
  }

  Widget _buildTile(Track t) {
    ListTile tile = ListTile(
      key: Key(t.id.toString()),
      leading: CircleAvatar(
        backgroundImage: t.coverImage,
        radius: 25,
      ),
      title: Text(t.name),
      subtitle: Text(t.author.name),
      trailing: Icon(Icons.reorder),
    );

    return t.compareTo(
                GetItReference.getIt.get<DroptunePlayer>().getCurrentTrack()) !=
            0
        ? tile
        : Container(
            key: Key(t.id.toString()),
            color: Colors.cyan,
            child: tile,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Queue"),
      ),
      body: ReorderableListView(
          children: widget.queue.map<Widget>(_buildTile).toList(),
          onReorder: _onReorder),
    );
  }
}
