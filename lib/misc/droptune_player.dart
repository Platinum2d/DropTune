import 'package:audioplayers/audioplayers.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/foundation.dart';

class DroptunePlayer with ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isReproducing = false;
  final List<Track> queueTracks;
  int _reproducingIndex = 0;
  Duration position;

  DroptunePlayer({@required this.queueTracks}) {
    audioPlayer.setUrl(queueTracks[0].path);
    position = Duration(seconds: 0);
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
    notifyListeners();
  }

  Track getCurrentTrack() {
    return queueTracks[_reproducingIndex];
  }

  void moveTrack(int toMove, int target) {
    if (toMove < 0 ||
        toMove >= queueTracks.length ||
        target < 0 ||
        target >= queueTracks.length) return;

    Track trackToMove = queueTracks[toMove];
    queueTracks.remove(queueTracks[toMove]);
    queueTracks.insert(target, trackToMove);
    notifyListeners();
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
}
