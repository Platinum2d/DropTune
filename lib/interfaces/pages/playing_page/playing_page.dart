import 'package:droptune/interfaces/pages/playing_page/playing_page_slider.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/marquee.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/playlist.dart';
import 'package:flutter/material.dart';

class PlayingPage extends StatefulWidget {
  final DroptunePlayer _player = GetItReference.getIt.get<DroptunePlayer>();

  @override
  State createState() {
    return _PlayingPageState();
  }
}

class _PlayingPageState extends State<PlayingPage>
    with TickerProviderStateMixin {
  bool dismissed = false;
  AnimationController _playPauseAnimationController;

  _PlayingPageState();

  @override
  void initState() {
    super.initState();
    _playPauseAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  Widget _buildTitleAndSettings() {
    return Column(
      children: <Widget>[
        MarqueeWidget(
          pauseDuration: Duration(milliseconds: 500),
          backDuration: Duration(seconds: 7),
          animationDuration: Duration(seconds: 13),
          child: Text(
            widget._player.getCurrentTrack().name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        Text(widget._player.getCurrentTrack().author.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black45))
      ],
    );
  }

  Widget _buildSlider(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PlayingPageSlider(),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
            flex: 11,
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Image.asset('assets/images/shuffle_icon.png'),
            )),
        Flexible(
          flex: 20,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget._player.moveToPreviousTrack();
              });
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Transform.rotate(
                    angle: 3.14,
                    child: Image.asset('assets/images/forward_button.png')),
              ),
            ),
          ),
        ),
        Flexible(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget._player.isReproducing) {
                      widget._player.pause();
                      _playPauseAnimationController.reverse();
                    } else {
                      widget._player.resume();
                      _playPauseAnimationController.forward();
                    }
                  });
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
                          image: AssetImage(
                              'assets/images/pause_play_button.png'))),
                ),
              ),
            )),
        Flexible(
            flex: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget._player.moveToNextTrack();
                });
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Image.asset('assets/images/forward_button.png'),
                ),
              ),
            )),
        Flexible(
            flex: 11,
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Image.asset('assets/images/repeat_icon.png'),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    widget._player.isReproducing
        ? _playPauseAnimationController.forward()
        : _playPauseAnimationController.reverse();

    return Dismissible(
      background: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
      onResize: () {
        if (dismissed) return;
        Navigator.of(context).pop();
        dismissed = true;
      },
      key: Key('playing page'),
      direction: DismissDirection.vertical,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.dstATop),
                  image: widget._player.getCurrentTrack().coverImage,
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    widget._player.reproducingPlaylist != null &&
                            widget._player.reproducingPlaylist.name !=
                                "All tracks"
                        ? Column(
                            children: <Widget>[
                              Text(
                                "Reproducing from playlist",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                widget._player.reproducingPlaylist.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )
                            ],
                          )
                        : Container(),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 15, top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Routing.goToQueue(
                                context,
                                GetItReference.getIt
                                    .get<DroptunePlayer>()
                                    .queueTracks,
                                clearStack: false);
                          },
                          child: Image(
                            color: Colors.black54,
                            image: AssetImage("assets/images/queue_icon.png"),
                            width: 21,
                            height: 21,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 20,
                child: Container(),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 45),
                    child: _buildTitleAndSettings(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: _buildSlider(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
                    child: _buildControls(),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
