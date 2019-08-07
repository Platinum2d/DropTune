import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/marquee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverlayBarWidget extends StatefulWidget {
  @override
  _OverlayBarWidgetState createState() => _OverlayBarWidgetState();
}

class _OverlayBarWidgetState extends State<OverlayBarWidget> {
  @override
  Widget build(BuildContext context) {
    DroptunePlayer player = Provider.of<DroptunePlayer>(context);

    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  player.getCurrentTrack().name,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  " • " + player.getCurrentTrack().author.name,
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              player.isReproducing ? player.pause() : player.resume();
            },
            child: Padding(
              child:
                  Icon(!player.isReproducing ? Icons.play_arrow : Icons.pause),
              padding: EdgeInsets.only(right: 20),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(color: Color(0xfff4f8f9)),
      //decoration: BoxDecoration(color: Colors.red),
    );
  }
}
