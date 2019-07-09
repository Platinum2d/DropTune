import 'package:droptune/interfaces/pages/generics/details_pages/album_details.dart';
import 'package:droptune/interfaces/pages/generics/details_pages/author_details.dart';
import 'package:droptune/interfaces/pages/generics/details_pages/playlist_details.dart';
import 'package:droptune/interfaces/pages/playing_page.dart';
import 'package:droptune/interfaces/pages/queue_page.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

/* same as Application */
class Routing {
  static Router router = Router();

  static _push(BuildContext context, Widget toPush) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => toPush));
  }

  static _pushReplacement(BuildContext context, Widget toPush) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => toPush));
  }

  static goToSplashPage(context, {bool clearStack}) {
    Routing.router.navigateTo(context, Routes.root,
        clearStack: clearStack, transition: TransitionType.native);
  }

  static goToLogin(context, {bool clearStack}) {
    Routing.router.navigateTo(context, Routes.login,
        clearStack: clearStack, transition: TransitionType.native);
  }

  static goToRegister(context, {bool clearStack}) {
    Routing.router.navigateTo(context, Routes.register,
        clearStack: clearStack, transition: TransitionType.native);
  }

  static goToAccessHub(context, {bool clearStack}) {
    Routing.router.navigateTo(context, Routes.accessHub,
        clearStack: clearStack, transition: TransitionType.native);
  }

  static goToMainPage(context, {bool clearStack}) {
    Routing.router.navigateTo(context, Routes.mainPage,
        clearStack: clearStack, transition: TransitionType.native);
  }

  static goToPlayingPage(context, Track track, Playlist playlist,
      {bool clearStack}) {
    if (clearStack)
      _pushReplacement(
          context,
          PlayingPage(
            track,
            playlist: playlist,
          ));
    else
      _push(
          context,
          PlayingPage(
            track,
            playlist: playlist,
          ));
  }

  static goToAuthorDetails(context, Author author, {bool clearStack}) {
    if (clearStack)
      _pushReplacement(context, AuthorDetailsPage(author));
    else
      _push(context, AuthorDetailsPage(author));
  }

  static goToPlaylistDetails(context, Playlist playlist, {bool clearStack}) {
    if (clearStack)
      _pushReplacement(
          context,
          PlaylistDetailsPage(
            playlist: playlist,
          ));
    else
      _push(
          context,
          PlaylistDetailsPage(
            playlist: playlist,
          ));
  }

  static goToAlbumDetails(context, Album album, int index, {bool clearStack}) {
    if (clearStack)
      _pushReplacement(
          context,
          AlbumDetailsPage(
            album: album,
            index: index,
          ));
    else
      _push(
          context,
          AlbumDetailsPage(
            album: album,
            index: index,
          ));
  }

  static goToQueue(context, List<Track> tracks, {bool clearStack}) {
    if (clearStack)
      _pushReplacement(context, QueuePage(tracks));
    else
      _push(context, QueuePage(tracks));
  }
}
