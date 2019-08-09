import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:flutter/material.dart';

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
    _listenerSubscription =
        widget.player.audioPlayer.onAudioPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          _currentPosition = p;
        });
      }
    });

    int currentMinutes = _currentPosition.inMinutes;
    int currentSeconds =
        _currentPosition.inSeconds - 60 * _currentPosition.inMinutes;

    int durationMinutes = widget.player.getCurrentTrack().duration.inMinutes;
    int durationSeconds = (widget.player.getCurrentTrack().duration.inSeconds - 60 * durationMinutes);


    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(currentMinutes.toString() +
                  ":" +
                  (currentSeconds < 10 ? "0" : "") +
                  currentSeconds.toString()),
              Text(durationMinutes.toString() +
                  ":" + (durationSeconds < 10 ? "0" : "") +
                  durationSeconds.toString())
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Slider(
            activeColor: Colors.cyan,
            value: _currentPosition.inMilliseconds.toDouble(),
            min: 0,
            max: widget.player
                .getCurrentTrack()
                .duration
                .inMilliseconds
                .toDouble(),
            inactiveColor: Colors.grey[400],
            onChangeStart: (value) {
              widget.player.pause();
            },
            onChanged: (newProgress) {
              setState(() {
                _currentPosition = Duration(milliseconds: newProgress.toInt());
              });
            },
            onChangeEnd: (newProgress) {
              widget.player.seekTo(Duration(milliseconds: newProgress.toInt()));
              widget.player.resume();
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _listenerSubscription.cancel();
  }
}
