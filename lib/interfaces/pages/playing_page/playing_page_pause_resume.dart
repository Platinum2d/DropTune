import 'package:droptune/misc/droptune_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingPagePauseResume extends StatefulWidget {
  @override
  _PlayingPagePauseResumeState createState() => _PlayingPagePauseResumeState();
}

class _PlayingPagePauseResumeState extends State<PlayingPagePauseResume>
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

    return Flexible(
        flex: 40,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () {
              if (player.isReproducing) {
                player.pause();
                _playPauseAnimationController.reverse();
              } else {
                player.resume();
                _playPauseAnimationController.forward();
              }
            },
            child: Container(
              alignment: Alignment(0, 0),
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _playPauseAnimationController,
                color: Colors.white,
                size: 40.0,
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment(0, 0),
                      image:
                          AssetImage('assets/images/pause_play_button.png'))),
            ),
          ),
        ));
  }
}
