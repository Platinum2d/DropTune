import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/music_utils.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget built = Scaffold(
        body: Container(
      alignment: Alignment(0, 0),
      child: Image.asset(
        'assets/images/droptune_logo.png',
        height: 125,
        width: 125,
      ),
    ));

    load(context);

    return built;
  }

  void load(BuildContext context) async {
    MusicUtils.getAllTracks().then((tracks){
      List<Track> allTracks = tracks;
      GetItReference.getIt.registerSingleton(allTracks);
      Routing.goToAccessHub(context, clearStack: true);
    });

  }
}
