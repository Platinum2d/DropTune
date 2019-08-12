import 'package:audioplayers/audioplayers.dart';
import 'package:droptune/misc/queue_generators/queue_generator.dart';
import 'package:droptune/misc/queue_generators/shuffled_queue_generator.dart';
import 'package:droptune/misc/queue_generators/sorted_queue_generator.dart';
import 'package:droptune/models/album.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class DroptunePlayer with ChangeNotifier  {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isReproducing = false;
  bool isShuffling = false;

  List<Track> queueTracks;

  Playlist _playlist;
  Album _album;
  Author _author;

  set reproducingPlaylist(Playlist playlist){
    _album = null;
    _author = null;
    _playlist = playlist;
  }

  set reproducingAlbum(Album album){
    _author = null;
    _playlist = null;
    _album = album;
  }

  set reproducingAuthor(Author author){
    _album = null;
    _playlist = null;
    _author = author;
  }

  set reproducingIndex(int value) {
    _reproducingIndex = value;
  }

  Playlist get reproducingPlaylist => _playlist;
  Album get reproducingAlbum => _album;
  Author get reproducingAuthor => _author;
  int get reproducingIndex => _reproducingIndex;

  int _reproducingIndex = 0;
  Duration position;

  DroptunePlayer({@required this.queueTracks}) {
    audioPlayer.setUrl(queueTracks[0].path);
    position = Duration(seconds: 0);
    audioPlayer.onPlayerCompletion.listen((_){
      moveToNextTrack();
    });
    audioPlayer.onAudioPositionChanged.listen((p){
      position = p;
      save();
      notifyListeners();
    });
  }



  Track moveTo(int index) {
    if (index < 0) {
      _reproducingIndex = 0;
      return queueTracks[_reproducingIndex];
    }

    if (index >= queueTracks.length) {
      _reproducingIndex = queueTracks.length - 1;
      return queueTracks[_reproducingIndex];
    }

    _reproducingIndex = index;

    audioPlayer.play(queueTracks[_reproducingIndex].path);
    isReproducing = true;
    notifyListeners();
    return queueTracks[_reproducingIndex];
  }

  Track moveToTrack(Track track) {
    int position = 0;
    for (Track t in this.queueTracks) {
      if (t.compareTo(track) == 0) break;
      position++;
    }

    Track t = moveTo(position);
    audioPlayer.play(t.path);
    isReproducing = true;
    notifyListeners();
    return t;
  }

  Track moveToNextTrack() {
    Track next = moveTo(++_reproducingIndex);
    audioPlayer.play(next.path);
    isReproducing = true;
    notifyListeners();
    return next;
  }

  Track moveToPreviousTrack() {
    Track previous = moveTo(--_reproducingIndex);
    audioPlayer.play(previous.path);
    isReproducing = true;
    notifyListeners();
    return previous;
  }

  void addTrack(Track track) {
    queueTracks.add(track);
    QueueGenerator queueGenerator = isShuffling ? ShuffledQueueGenerator() : SortedQueueGenerator();
    queueTracks = queueGenerator.createQueue(queueTracks);
    notifyListeners();
  }

  void rawAddTrack(Track track){
    queueTracks.add(track);
    notifyListeners();
  }

  Track getCurrentTrack() {
    return queueTracks[_reproducingIndex];
  }

  int getTrackIndex(Track track){
    for (int i = 0; i < queueTracks.length; i++)
      if (track.compareTo(queueTracks[i]) == 0) return i;

      return -1;
  }

  void moveTrack(int toMove, int target) {
    if (toMove < 0 ||
        toMove >= queueTracks.length ||
        target < 0 ||
        target >= queueTracks.length) return;

    Track currentTrack = getCurrentTrack();
    Track trackToMove = queueTracks[toMove];
    queueTracks.remove(queueTracks[toMove]);
    queueTracks.insert(target, trackToMove);

    _reproducingIndex = getTrackIndex(currentTrack); //inefficient!
    notifyListeners();
  }

  void enqueue(Track track){
    queueTracks.insert(_reproducingIndex + 1, track);
  }

  void seekTo(Duration newPosition){
    position = newPosition;
    audioPlayer.seek(newPosition);
    notifyListeners();
  }

  void pause() {
    audioPlayer.pause();
    isReproducing = false;
    notifyListeners();
  }

  void stop() {
    audioPlayer.stop();
    isReproducing = false;
    notifyListeners();
  }

  void resume() {
    audioPlayer.resume();
    isReproducing = true;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
    "reproducingIndex": _reproducingIndex,
    "isShuffling": isShuffling,
    "position": position.inMilliseconds,
    "queueTracks": queueTracks,
    "reproducingPlaylist": _playlist,
    "reproducingAlbum": _album,
    "reproducingAuthor": _author
  };

  void save() {
    SharedPreferences.getInstance().then((sp){
      sp.setString("player", json.encode(toJson()));
    });
  }

  @override
  void dispose() {
    return;
  }
}
