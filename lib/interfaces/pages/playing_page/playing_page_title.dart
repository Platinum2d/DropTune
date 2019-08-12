import 'package:droptune/misc/droptune_player.dart';
import 'package:droptune/misc/marquee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingPageTitle extends StatefulWidget {
  @override
  _PlayingPageTitleState createState() => _PlayingPageTitleState();
}

class _PlayingPageTitleState extends State<PlayingPageTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MarqueeWidget.droptuneDefaultMarquee(
            child: Text(
          Provider.of<DroptunePlayer>(context).getCurrentTrack().name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        )),
        Text(Provider.of<DroptunePlayer>(context).getCurrentTrack().author.name,
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
}
