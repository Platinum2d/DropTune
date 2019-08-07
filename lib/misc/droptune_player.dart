import 'package:audioplayers/audioplayers.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/foundation.dart';

class DroptunePlayer with ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  bool isReproducing = false;
  final List<Track> tracks;
  int _reproducingIndex = 0;

  DroptunePlayer({@required this.tracks}){
    player.setUrl(tracks[0].path);
  }

  Track moveTo(int index) {
    if (index < 0) {
      _reproducingIndex = 0;
      return tracks[_reproducingIndex];
    }

    if (index >= tracks.length) {
      _reproducingIndex = tracks.length - 1;
      return tracks[_reproducingIndex];
    }

    _reproducingIndex = index;

    player.play(tracks[_reproducingIndex].path);
    isReproducing = true;
    notifyListeners();
    return tracks[_reproducingIndex];
  }

  Track moveToTrack(Track track) {
    int position = 0;
    for (Track t in this.tracks) {
      if (t.compareTo(track) == 0) break;
      position++;
    }

    Track t = moveTo(position);
    player.play(t.path);
    isReproducing = true;
    notifyListeners();
    return t;
  }

  Track moveToNextTrack() {
    Track next = moveTo(++_reproducingIndex);
    player.play(next.path);
    isReproducing = true;
    notifyListeners();
    return next;
  }

  Track moveToPreviousTrack() {
    Track previous = moveTo(--_reproducingIndex);
    player.play(previous.path);
    isReproducing = true;
    notifyListeners();
    return previous;
  }

  void addTrack(Track track) {
    tracks.add(track);
    notifyListeners();
  }

  Track getCurrentTrack() {
    return tracks[_reproducingIndex];
  }

  void moveTrack(int toMove, int target) {
    if (toMove < 0 ||
        toMove >= tracks.length ||
        target < 0 ||
        target >= tracks.length) return;

    Track trackToMove = tracks[toMove];
    tracks.remove(tracks[toMove]);
    tracks.insert(target, trackToMove);
    notifyListeners();
  }

  void pause(){
    player.pause();
    isReproducing = false;
    notifyListeners();
  }

  void stop(){
    player.stop();
    isReproducing = false;
    notifyListeners();
  }

  void resume(){
    player.resume();
    isReproducing = true;
    notifyListeners();
  }
}
