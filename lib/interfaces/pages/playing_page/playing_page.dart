import 'package:droptune/interfaces/pages/playing_page/playing_page_pause_resume.dart';
import 'package:droptune/interfaces/pages/playing_page/playing_page_slider.dart';
import 'package:droptune/interfaces/pages/playing_page/playing_page_title.dart';
import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/marquee.dart';
import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/misc/queue_generators/shuffled_queue_generator.dart';
import 'package:droptune/misc/queue_generators/sorted_queue_generator.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  Widget _buildMainTitle() {
    String groupType;
    String title;

    if (widget._player.reproducingPlaylist != null) {
      if (widget._player.reproducingPlaylist.id < 0) return Container();
      groupType = "playlist";
      title = widget._player.reproducingPlaylist.name;
    } else if (widget._player.reproducingAlbum != null) {
      groupType = "album";
      title = widget._player.reproducingAlbum.name;
    } else {
      groupType = "author";
      title = widget._player.reproducingAuthor.name;
    }

    return Column(
      children: <Widget>[
        Text(
          "Reproducing from " + groupType,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        )
      ],
    );
  }

  Widget _buildTitleAndSettings() {
    DroptunePlayer myPlayer = widget._player;

    return ChangeNotifierProvider(
      builder: (context) => myPlayer,
      child: PlayingPageTitle(),
    );
  }

  Widget _buildSlider(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ChangeNotifierProvider(
        builder: (context) => GetItReference.getIt.get<DroptunePlayer>(),
        child: PlayingPageSlider(),
      ),
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
              child: Visibility(
                child: Image.asset('assets/images/repeat_icon.png'),
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                
              ),
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
              padding: EdgeInsets.all(7),
              child: Transform.rotate(
                  angle: 3.14,
                  child: Image.asset('assets/images/forward_button.png')),
            ),
          ),
        ),
        ChangeNotifierProvider(
          builder: (context) => widget._player,
          child: PlayingPagePauseResume(),),
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget._player.isShuffling = !widget._player.isShuffling;
                  QueueGenerator queueGenerator = widget._player.isShuffling
                      ? ShuffledQueueGenerator()
                      : SortedQueueGenerator(sortingKey: (a, b) {
                          return a.compareTo(b);
                        });

                  Track currentTrack = widget._player.getCurrentTrack();
                  widget._player.queueTracks =
                      queueGenerator.createQueue(widget._player.queueTracks);
                  widget._player.reproducingIndex =
                      widget._player.getTrackIndex(currentTrack);
                });
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(9),
                  child: Image.asset(
                    'assets/images/shuffle_icon.png',
                    color:
                        widget._player.isShuffling ? Colors.black : Colors.grey,
                  ),
                ),
              ),
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
                    _buildMainTitle(),
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
                                    .queueTracks);
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
