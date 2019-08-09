import 'package:droptune/misc/droptune_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingPageSlider extends StatefulWidget {
  @override
  _PlayingPageSliderState createState() => _PlayingPageSliderState();
}

class _PlayingPageSliderState extends State<PlayingPageSlider> {
  Duration _currentPosition;
  var _listenerSubscription;
  bool _wasReproducing;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _currentPosition = Provider.of<DroptunePlayer>(context).position;

    int currentMinutes = _currentPosition.inMinutes;
    int currentSeconds =
        _currentPosition.inSeconds - 60 * _currentPosition.inMinutes;

    int durationMinutes = Provider.of<DroptunePlayer>(context).getCurrentTrack().duration.inMinutes;
    int durationSeconds = (Provider.of<DroptunePlayer>(context).getCurrentTrack().duration.inSeconds - 60 * durationMinutes);


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
            max: Provider.of<DroptunePlayer>(context)
                .getCurrentTrack()
                .duration
                .inMilliseconds
                .toDouble(),
            inactiveColor: Colors.grey[400],
            onChangeStart: (value) {
              _wasReproducing = Provider.of<DroptunePlayer>(context).isReproducing;
              Provider.of<DroptunePlayer>(context).pause();
            },
            onChanged: (newProgress) {
              setState(() {
                _currentPosition = Duration(milliseconds: newProgress.toInt());
              });
            },
            onChangeEnd: (newProgress) {
              Provider.of<DroptunePlayer>(context).seekTo(Duration(milliseconds: newProgress.toInt()));
              if (_wasReproducing) Provider.of<DroptunePlayer>(context).resume();
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
