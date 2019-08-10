import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingPageSlider extends StatefulWidget {
  @override
  _PlayingPageSliderState createState() => _PlayingPageSliderState();
}

class _PlayingPageSliderState extends State<PlayingPageSlider> {
  bool _wasReproducing;
  DroptunePlayer _player;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _player = Provider.of<DroptunePlayer>(context);

    int currentMinutes = _player.position.inMinutes;
    int currentSeconds =
        _player.position.inSeconds - 60 * _player.position.inMinutes;

    int durationMinutes = _player.getCurrentTrack().duration.inMinutes;
    int durationSeconds =
        (_player.getCurrentTrack().duration.inSeconds - 60 * durationMinutes);

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
                  ":" +
                  (durationSeconds < 10 ? "0" : "") +
                  durationSeconds.toString())
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Slider(
            activeColor: Colors.cyan,
            value: _player.position.inMilliseconds.toDouble(),
            min: 0,
            max: _player.getCurrentTrack().duration.inMilliseconds.toDouble(),
            inactiveColor: Colors.grey[400],
            onChangeStart: (value) {
              _wasReproducing = _player.isReproducing;
              _player.pause();
            },
            onChanged: (newProgress) {
              setState(() {
                _player.position = Duration(milliseconds: newProgress.toInt());
              });
            },
            onChangeEnd: (newProgress) {
              _player.seekTo(Duration(milliseconds: newProgress.toInt()));
              if (_wasReproducing) _player.resume();
            },
          ),
        )
      ],
    );
  }
}
