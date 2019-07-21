import 'package:droptune/interfaces/access/access_hub.dart';
import 'package:droptune/interfaces/access/login.dart';
import 'package:droptune/interfaces/access/register.dart';
import 'package:droptune/interfaces/pages/main_page.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/no_glow_scroll_behavior.dart';
import 'package:droptune/misc/permissions/permissions_hub.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:droptune/interfaces/splash.dart';
import 'package:droptune/misc/routing/routes.dart';

void main() {
  runApp(DroptuneApp());
}

class DroptuneApp extends StatelessWidget {
  final double inputRadius = 50.0;
  final double buttonRadius = 20.0;

  Future<List<Song>> loadTracks() async {
    List<Song> songs;
    try {
      songs = await MusicFinder.allSongs();
      return songs;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  void registerSingletons(){
    GetItReference.getIt.registerSingleton<PermissionsHub>(PermissionsHub());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Routes.configureRoutes(Routing.router);
    registerSingletons();

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Droptune',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: child,
        );
      },
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Color(0xff03b8fa),
          brightness: Brightness.light,
          fontFamily: "Poppins",
          buttonColor: Color(0xffd9ffff),
          appBarTheme:
              AppBarTheme(color: Color(0xfffafafa), elevation: 0),
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius))),
          inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              isCollapsed: true,
              filled: true,
              fillColor: Color(0xff99f2fa),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(inputRadius)))),
      home: SplashPage(),
    );
  }
}
