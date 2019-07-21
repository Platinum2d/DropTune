import 'package:droptune/interfaces/pages/generics/entries/track_entry.dart';
import 'package:droptune/misc/utils/droptune_utils.dart';
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
      final Track item =  widget.queue.removeAt(oldIndex);
      widget.queue.insert(newIndex, item);
    });
  }

  Widget _buildTile(Track t) {
    return ListTile(
      key: Key(t.id.toString()),
      leading: CircleAvatar(
        backgroundImage: t.coverImage,
        radius: 25,
      ),
      title: Text(t.name),
      subtitle: Text(t.author.name),
      trailing: Icon(Icons.reorder),
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
