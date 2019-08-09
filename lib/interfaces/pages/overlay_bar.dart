import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/marquee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverlayBarWidget extends StatefulWidget {
  @override
  _OverlayBarWidgetState createState() => _OverlayBarWidgetState();
}

class _OverlayBarWidgetState extends State<OverlayBarWidget>
    with TickerProviderStateMixin {
  AnimationController _playPauseAnimationController;


  @override
  void initState() {
    super.initState();
    _playPauseAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    DroptunePlayer player = Provider.of<DroptunePlayer>(context);
    
    player.isReproducing
        ? _playPauseAnimationController.forward()
        : _playPauseAnimationController.reverse();

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
                  player
                      .getCurrentTrack()
                      .name,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  " • " + player
                      .getCurrentTrack()
                      .author
                      .name,
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (player.isReproducing) {
                player.pause();
                _playPauseAnimationController.reverse();
              } else {
                player.resume();
                _playPauseAnimationController.forward();
              }
            },
            child: Padding(
              child:
              AnimatedIcon(icon: AnimatedIcons.play_pause,
                  progress: _playPauseAnimationController),
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
