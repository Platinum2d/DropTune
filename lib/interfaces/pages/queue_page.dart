import 'package:droptune/interfaces/pages/queue_page_item.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueuePage extends StatefulWidget {
  final List<Track> queue;
  DroptunePlayer player;

  QueuePage(this.queue);

  @override
  State createState() {
    player = GetItReference.getIt.get<DroptunePlayer>();
    return _QueuePageState();
  }
}

class _QueuePageState extends State<QueuePage> {
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      GetItReference.getIt.get<DroptunePlayer>().moveTrack(oldIndex, newIndex);
    });
  }

  Widget _buildTile(Track t) {
    return ChangeNotifierProvider(
      key: Key(t.id.toString()),
      builder: (context) => widget.player,
      child: QueuePageItem(track: t,),);
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
