import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingPageSlider extends StatefulWidget {
  final DroptunePlayer player = GetItReference.getIt.get<DroptunePlayer>();

  @override
  _PlayingPageSliderState createState() => _PlayingPageSliderState();
}

class _PlayingPageSliderState extends State<PlayingPageSlider> {
  Duration _currentPosition;
  var _listenerSubscription;


  @override
  void initState() {
    super.initState();
    _currentPosition = widget.player.position;
  }

  @override
  Widget build(BuildContext context) {
    _listenerSubscription = widget.player.audioPlayer.onAudioPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          _currentPosition = p;
        });
      }
    });

    return Slider(
        activeColor: Colors.cyan,
        value: _currentPosition.inMilliseconds.toDouble(),
        min: 0,
        max: widget.player.getCurrentTrack().duration.inMilliseconds.toDouble(),
        inactiveColor: Colors.grey[400],
        onChanged: (double newProgress) {});
  }

  @override
  void dispose() {
    super.dispose();
    _listenerSubscription.cancel();
  }
}
